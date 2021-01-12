import 'package:barberapp/app/data/provider/auth_provider.dart';
import 'package:barberapp/app/data/repository/auth_repository.dart';
import 'package:get/get.dart';

import 'package:barberapp/app/modules/signup/controllers/signup_controller.dart';

class SignupBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignupController>(
      () => SignupController(),
    );

    Get.lazyPut<AuthRepository>(
      () => AuthRepository(),
    );

    Get.lazyPut<AuthApiClient>(
      () => AuthApiClient(),
    );
  }
}
