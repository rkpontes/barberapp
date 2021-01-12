import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:barberapp/app/data/repository/auth_repository.dart';
import 'package:barberapp/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  final repository = Get.find<AuthRepository>();
  Auth auth;
  final formKey = GlobalKey<FormState>();
  TextEditingController usernameCtrl = TextEditingController();
  TextEditingController passwordCtrl = TextEditingController();
  final box = GetStorage('barberapp');

  RxBool showPassword = false.obs;
  RxBool loading = false.obs;

  void login() async{
    if (formKey.currentState.validate()){
      loading.value = true;
      await repository.login(usernameCtrl.text, passwordCtrl.text).then((auth){
        if(auth != null){
          box.write('auth', auth);
          Get.offAllNamed(Routes.HOME);
        }
        loading.value = false;
      }).catchError((err){
        loading.value = false;
      });
      
    }
  }

  void toRegister(){
    Get.offAndToNamed(Routes.SIGNUP);
  }

}
