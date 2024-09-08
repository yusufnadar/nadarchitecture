const testRepositoryImpl = """
import 'package:dartz/dartz.dart';

import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/base/model/pagination_model/base_pagination_model.dart';
import '../../../../core/services/network/mapper/api_model_mapper.dart';
import '../../domain/entities/test_entity.dart';
import '../../domain/repositories/test_repository.dart';
import '../data_sources/test_data_source.dart';

class TestRepositoryImpl extends TestRepository {
  final TestRemoteDataSource _testRemoteDataSource;

  TestRepositoryImpl(this._testRemoteDataSource);

  @override
  Future<Either<BaseErrorModel, BasePaginationModel<TestEntity>>> getDataPaginate(
    int page,
  ) async {
    final result = await _testRemoteDataSource.getDataPagination(page);
    return result.fold(
      (error) {
        return Left(BaseErrorModel(message: error.message));
      },
      (response) {
        return Right(
          APIModelMapper.paginationModelToEntity(
            response,
            response.data!.map((e) => TestEntity.fromJson(e.toJson())).toList(),
          ),
        );
      },
    );
  }

  @override
  Future<Either<BaseErrorModel, TestEntity>> getData() async {
    final result = await _testRemoteDataSource.getData();
    return result.fold(
      (error) {
        return Left(BaseErrorModel(message: error.message));
      },
      (response) {
        return Right(TestEntity.fromJson(response.toJson()));
      },
    );
  }

  @override
  Future<Either<BaseErrorModel, void>> uploadFile() async {
    final result = await _testRemoteDataSource.uploadFile();
    return result.fold(
      (error) {
        return Left(BaseErrorModel(message: error.message));
      },
      (response) {
        return const Right(null);
      },
    );
  }
}
""";