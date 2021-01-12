import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;
  const AlreadyHaveAnAccountCheck({
    Key key,
    this.login = true,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          login ? "Você possui uma conta? " : "Já tem uma conta? ",
          style: TextStyle(color: Get.theme.primaryColor),
        ),
        GestureDetector(
          onTap: press,
          child: Text(
            login ? "Registrar" : "Login",
            style: TextStyle(
              color: Get.theme.primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}