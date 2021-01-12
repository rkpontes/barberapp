import 'package:barberapp/app/data/provider/auth_provider.dart';
import 'package:barberapp/app/data/repository/auth_repository.dart';
import 'package:barberapp/app/modules/login/controllers/login_controller.dart';
import 'package:get/get.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginController>(() => LoginController());
    Get.lazyPut<AuthRepository>(() => AuthRepository());
    Get.lazyPut<AuthApiClient>(() => AuthApiClient());
  }
}
