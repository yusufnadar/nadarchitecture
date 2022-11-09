const userController = """
import 'package:get/get.dart';
import '../../core/base/base_exception.dart';
import '../../core/constants/end_points.dart';
import '../../core/constants/enums/http_type_enums.dart';
import '../../core/init/services/get_it_service.dart';
import '../../core/init/services/network_service.dart';
import '../models/user_model.dart';

class UserController extends GetxController with BaseException {
  final networkService = GetItService.getIt.get<NetworkService>();

  final _user = UserModel().obs;

  UserModel get user => _user.value;

  set user(UserModel user) => _user.value = user;

  // use after register or login method
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

  // use to get user
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
      showExceptionError(error);
    } catch (error) {
      showError(error);
    }
  }
}
 """;
