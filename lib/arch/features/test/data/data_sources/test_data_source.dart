const testDataSource = """
import 'package:dartz/dartz.dart';

import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/base/model/pagination_model/base_pagination_model.dart';
import '../../../../core/consts/end_point/app_end_points.dart';
import '../../../../core/consts/enum/http_type_enums.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../../../core/services/network/network_service.dart';
import '../models/test_model.dart';

abstract class TestRemoteDataSource {
  Future<Either<BaseErrorModel, BasePaginationModel<TestModel>>> getDataPagination(int page);

  Future<Either<BaseErrorModel, TestModel>> getData();

  Future<Either<BaseErrorModel, void>> uploadFile();
}

class TestRemoteDataSourceImpl extends TestRemoteDataSource {
  final NetworkService _networkService;

  TestRemoteDataSourceImpl(this._networkService);

  @override
  Future<Either<BaseErrorModel, TestModel>> getData() async {
    return await _networkService(
      AppEndpoints.getData,
      httpTypes: HttpTypes.get,
      mapper: (json) => APIModelMapper.jsonToItem(json, TestModel.fromJson),
    );
  }

  @override
  Future<Either<BaseErrorModel, BasePaginationModel<TestModel>>> getDataPagination(int page) async {
    return await _networkService(
      AppEndpoints.getData,
      httpTypes: HttpTypes.get,
      data: {
        'page': page,
        'perPage': 6,
      },
      mapper: (json) => APIModelMapper.paginate(json, TestModel.fromJson),
    );
  }

  @override
  Future<Either<BaseErrorModel, void>> uploadFile() async {
    return await _networkService(
      AppEndpoints.uploadFile,
      httpTypes: HttpTypes.post,
      data: {
        'name': 'name',
        /*
        'input': await MultipartFile.fromFile(
          file.path,
          filename: fileName,
          contentType: MediaType("image", "jpeg"),
        ),
         */
      },
      mapper: (_) {},
    );
  }
}
""";