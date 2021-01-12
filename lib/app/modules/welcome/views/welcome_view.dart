import 'package:barberapp/app/global/widgets/rounded_button.dart';
import 'package:barberapp/app/modules/welcome/controllers/welcome_controller.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'widgets/background.dart';

class WelcomeView extends GetView<WelcomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "BEM VINDO AO BARBER APP",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: Get.height * 0.05),
              SvgPicture.asset(
                "assets/chat.svg",
                height: Get.height * 0.45,
              ),
              SizedBox(height: Get.height * 0.05),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Get.offAndToNamed('/login');
                },
              ),
              RoundedButton(
                text: "REGISTRAR",
                color: Get.theme.primaryColorLight,
                textColor: Colors.black,
                press: () {
                  Get.offAndToNamed('/signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
