const loginRepository = """
import 'package:dartz/dartz.dart';

import '../../../../core/base/model/error_model/base_error_model.dart';
import '../../data/models/login_request/login_request_model.dart';
import '../entities/login_response/login_response_entity.dart';

abstract class LoginRepository {
  Future<Either<BaseErrorModel, LoginResponseEntity>> login(
    LoginRequestModel model,
  );
}
""";