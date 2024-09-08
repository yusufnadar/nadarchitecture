import 'package:dartz/dartz.dart';

import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../domain/entities/login_response/login_response_entity.dart';
import '../../domain/repositories/login_repository.dart';
import '../data_sources/login_data_source.dart';
import '../models/login_request/login_request_model.dart';

class LoginRepositoryImpl extends LoginRepository {
  final LoginRemoteDataSource _loginRemoteDataSource;

  LoginRepositoryImpl(this._loginRemoteDataSource);

  @override
  Future<Either<BaseErrorModel, LoginResponseEntity>> login(LoginRequestModel model) async {
    final result = await _loginRemoteDataSource.login(model);
    return result.fold(
      (error) {
        return Left(BaseErrorModel(message: error.message));
      },
      (response) {
        return Right(LoginResponseEntity.fromJson(response.toJson()));
      },
    );
  }
}
