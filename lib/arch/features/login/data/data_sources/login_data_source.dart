const loginDataSource = """
import 'package:dartz/dartz.dart';

import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/consts/end_point/app_end_points.dart';
import '../../../../core/consts/enum/http_type_enums.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../../../core/services/network/network_service.dart';
import '../models/login_request/login_request_model.dart';
import '../models/login_response/login_response_model.dart';

abstract class LoginRemoteDataSource {
  Future<Either<BaseErrorModel, LoginResponseModel>> login(LoginRequestModel model);
}

class LoginRemoteDataSourceImpl extends LoginRemoteDataSource {
  final NetworkService _networkService;

  LoginRemoteDataSourceImpl(this._networkService);

  @override
  Future<Either<BaseErrorModel, LoginResponseModel>> login(LoginRequestModel model) async {
    return await _networkService(
      AppEndpoints.getData,
      httpTypes: HttpTypes.get,
      data: model.toJson(),
      mapper: (json) => APIModelMapper.jsonToItem(json, LoginResponseModel.fromJson),
    );
  }
}
""";