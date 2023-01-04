const networkService = """
import 'dart:convert';
import 'dart:io';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../../../common/models/data_model.dart';
import '../../../utils/helpers/get_snackbars.dart';
import '../../base/base_model.dart';
import '../../constants/end_points.dart';
import '../../constants/enums/http_type_enums.dart';
import '../../constants/local_consts.dart';
import '../../constants/routes.dart';
import '../exceptions/http_exceptions.dart';
import 'get_it_service.dart';
import 'local_service.dart';

class NetworkService {
  String? _endPoint;
  Map<String, dynamic>? _body;
  final _localService = GetItService.getIt.get<LocalService>();
  final Map<HttpTypes, Function> _methods = {
    HttpTypes.get: http.get,
    HttpTypes.post: http.post,
    HttpTypes.put: http.put,
    HttpTypes.delete: http.delete
  };

  NetworkService setEndPoint(endPoint) {
    _endPoint = endPoint;
    return this;
  }

  NetworkService setBody(body) {
    _body = body;
    return this;
  }

  dynamic lastMethod;
  dynamic lastUrl;
  dynamic lastList;
  dynamic lastIsDataModel;

  Future fetch<T extends BaseModel>(methodName,
      {String? token,
      T? model,
      isDataModel,
      String? contentType,
      List? files}) async {
    try {
      Map<Symbol, dynamic> list = {};
      list = {
        const Symbol('headers'): {
          'Content-Type': contentType ?? 'application/json',
          'Authorization':
              'Bearer \${token ?? _localService.read(AppLocalConsts.accessToken)}'
        }
      };
      if (_body != null) {
        list.addAll({const Symbol('body'): json.encode(_body)});
      }
      lastMethod = _methods[methodName]!;
      lastUrl = [Uri.parse(EndPoints.baseUrl + _endPoint!)];
      lastList = list;
      lastIsDataModel = isDataModel;
      if (contentType == 'multipart/form-data') {
        final request = http.MultipartRequest(
            'POST', Uri.parse(EndPoints.baseUrl + _endPoint!));
        request.headers['Content-Type'] = contentType!;
        request.headers['Authorization'] =
            'Bearer \${token ?? _localService.read(AppLocalConsts.accessToken)}';
        for (var item in files!) {
          final file = await http.MultipartFile.fromPath('image', item.path);
          request.files.add(file);
        }
        var bodyKeyList = _body!.keys.toList();
        var bodyValueList = _body!.values.toList();
        for (int i = 0; i < _body!.length; i++) {
          request.fields[bodyKeyList[i]] = bodyValueList[i].toString();
        }
        return await responseHandle<T>(await request.send(), model, _endPoint,
            isDataModel, contentType, true);
      } else {
        return await responseHandle<T>(
            await Function.apply(
              _methods[methodName]!,
              [Uri.parse(EndPoints.baseUrl + _endPoint!)],
              list,
            ),
            model,
            _endPoint,
            isDataModel,
            contentType,
            false);
      }
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on FormatException {
      throw FetchDataException(
          'Bad Response Format \${EndPoints.baseUrl + _endPoint!}');
    }
  }

  Future<dynamic> responseHandle<T extends BaseModel>(response, T? model,
      endPoint, isDataModel, contentType, isStreamed) async {
    dynamic data;
    if (isStreamed == true) {
      final newResponse = await http.Response.fromStream(response);
      data = json.decode(utf8.decode(newResponse.bodyBytes));
    } else {
      data = json.decode(utf8.decode(response.bodyBytes));
    }
    if (response.statusCode >= 200 && response.statusCode <= 299) {
      if (isDataModel == true) {
        if (data is List) {
          return List<T>.from(data.map((e) => model!.fromJson(e))).toList();
        } else if (data is Map<String, dynamic>) {
          return DataModel().fromJson(data, model);
        }
      } else {
        if (model != null) {
          if (data is List) {
            return List<T>.from(
              data.map((e) => model.fromJson(e)),
            ).toList();
          } else if (data is Map<String, dynamic>) {
            return model.fromJson(data);
          }
        } else {
          return data;
        }
      }
    } else {
      switch (response.statusCode) {
        case 400:
          throw BadRequestException(data['message'].toString());
        case 401:
          if (EndPoints.refresh == endPoint) {
            await GetBars.warningSnackBar('Uyarı', 'Oturumunuzun süresi doldu');
            await _localService.remove(AppLocalConsts.accessToken);
            await _localService.remove(AppLocalConsts.refreshToken);
            return await Get.offAllNamed(Routes.register);
          } else {
            await refresh();
            return retry<T>(model, endPoint, response, contentType);
            if (data['message'] == 'token_not_valid') {
            } else {
              //throw UnauthorisedException(
              //  (data['message']).toString());
            }
          }
        case 500:
          throw BadRequestException(data['message'].toString());
        case 404:
          throw UnauthorisedException(data['message'].toString());
        default:
          throw FetchDataException(
            'Error accured while communicating with serverwith status code\${response.statusCode}',
          );
      }
    }
  }

  Future<dynamic> retry<T extends BaseModel>(
      T? model, String endPoint, http.Response response, contentType) async {
    try {
      lastList[const Symbol('headers')]['Authorization'] =
          'Bearer \${_localService.read(AppLocalConsts.accessToken)}';
      await responseHandle<T>(
          await Function.apply(lastMethod, lastUrl, lastList),
          model,
          endPoint,
          lastIsDataModel,
          contentType,
          false);
    } on SocketException {
      throw FetchDataException('No Internet Connection');
    } on FormatException {
      throw FetchDataException('Bad Response Format');
    }
  }

  Future refresh() async {
    var res = await http.post(Uri.parse(EndPoints.baseUrl + EndPoints.refresh),
        body: json.encode(
          {'refreshToken': _localService.read(AppLocalConsts.refreshToken)},
        ),
        headers: {'Content-Type': 'Application/json'});
    if (res.statusCode == 200) {
      var decodedCode = json.decode(res.body);
      await _localService.write(
          AppLocalConsts.accessToken, decodedCode['accessToken']);
    } else {
      await GetBars.errorSnackBar('Uyarı', 'Oturumunuzun süresi doldu');
      await _localService.remove(AppLocalConsts.accessToken);
      await Get.offAllNamed(Routes.register);
    }
  }
}
    """;
