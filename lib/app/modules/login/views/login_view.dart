import 'package:barberapp/app/global/widgets/already_have_an_account_acheck.dart';
import 'package:barberapp/app/global/widgets/rounded_button.dart';
import 'package:barberapp/app/global/widgets/rounded_input_field.dart';
import 'package:barberapp/app/global/widgets/rounded_password_field.dart';
import 'package:barberapp/app/modules/login/controllers/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import 'widgets/background.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Form(
            key: controller.formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "ENTRAR",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: Get.height * 0.03),
                SvgPicture.asset(
                  "assets/login.svg",
                  height: Get.height * 0.35,
                ),
                SizedBox(height: Get.height * 0.03),
                RoundedInputField(
                  hintText: "Usuário",
                  controller: controller.usernameCtrl,
                  onChanged: (value) {},
                ),
                Obx(
                  () => RoundedPasswordField(
                    showPassword: controller.showPassword.value,
                    changeShowPassword: () {
                      controller.showPassword.value =
                          !controller.showPassword.value;
                    },
                    controller: controller.passwordCtrl,
                    onChanged: (value) {},
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: !controller.loading.value,
                    child: RoundedButton(
                      text: "ENTRAR",
                      press: () {
                        controller.login();
                      },
                    ),
                  ),
                ),
                Obx(
                  () => Visibility(
                    visible: controller.loading.value,
                    child: Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      width: Get.width * 0.8,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(29),
                        child: FlatButton(
                          padding: EdgeInsets.symmetric(
                            vertical: 20,
                            horizontal: 40,
                          ),
                          onPressed: null,
                          child: CircularProgressIndicator(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Get.height * 0.03),
                AlreadyHaveAnAccountCheck(
                  press: () {
                    controller.toRegister();
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
