import 'package:dartz/dartz.dart';
import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../../../core/base/model/pagination_model/base_pagination_model.dart';
import '../entities/test_entity.dart';

abstract class TestRepository {
  Future<Either<BaseErrorModel, BasePaginationModel<TestEntity>>> getDataPaginate(
    int page,
  );

  Future<Either<BaseErrorModel, TestEntity>> getData();

  Future<Either<BaseErrorModel, void>> uploadFile();
}
