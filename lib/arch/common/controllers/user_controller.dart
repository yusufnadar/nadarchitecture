const userController =
"""
import 'package:get/get.dart';
import '../../core/base/base_exception.dart';
import '../../core/constants/end_points.dart';
import '../../core/constants/enums/http_type_enums.dart';
import '../../core/init/services/get_it_service.dart';
import '../../core/init/services/network_service.dart';
import '../models/user_model.dart';

class UserController extends GetxController {
  final networkService = GetItService.getIt.get<NetworkService>();
  final baseException = GetItService.getIt.get<BaseException>();

  final _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(UserModel user) => _user.value = user;

  Future getUserForAuth() async {
    try {
      UserModel? user = await networkService
          .setBody(null)
          .setEndPoint(EndPoints.getUser)
          .fetch<UserModel>(
            HttpTypes.get,
            responseModel: UserModel(),
          );
      if (user != null) {
        this.user = user;
      }
    } on Exception catch (_) {
      rethrow;
    } catch (_) {
      rethrow;
    }
  }

  Future getUser() async {
    try {
      UserModel? user = await networkService
          .setBody(null)
          .setEndPoint(EndPoints.getUser)
          .fetch<UserModel>(
            HttpTypes.get,
            responseModel: UserModel(),
          );
      if (user != null) {
        this.user = user;
      }
    } on Exception catch (error) {
      baseException.showExceptionError(error);
    } catch (error) {
      baseException.showError(error);
    }
  }
}
 """;
