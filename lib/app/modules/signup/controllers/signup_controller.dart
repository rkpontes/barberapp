import 'package:barberapp/app/data/model/user_model.dart';
import 'package:barberapp/app/data/repository/auth_repository.dart';
import 'package:barberapp/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  final repository = Get.find<AuthRepository>();
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  User user;
  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void register() async {
    if (formKey.currentState.validate()) {
      loading.value = true;
      User user = await repository.register(usernameCtrl.text, passwordCtrl.text).catchError((e){
        loading.value = false;
      });
      if (user != null) {
        // Direcionar para a tela de login
        Get.offAllNamed(Routes.LOGIN);
      }
      loading.value = false;
    }
  }

  void toLogin(){
    Get.offAndToNamed(Routes.LOGIN);
  }
}
