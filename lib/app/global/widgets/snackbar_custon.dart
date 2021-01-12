import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SnackbarCustom{

  static show(String title, String subtitle, Color color){
    Get.snackbar(
      "$title",
      "$subtitle",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: color,
      icon: Icon(Icons.notification_important),
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 5),
    );
  }

  static primary(String title, String subtitle){
    show(title, subtitle, Color(0xFFcce5ff));
  }

  static secondary(String title, String subtitle){
    show(title, subtitle, Color(0xFFe2e3e5));
  }

  static success(String title, String subtitle){
    show(title, subtitle, Color(0xFFd4edda));
  }

  static danger(String title, String subtitle){
    show(title, subtitle, Color(0xFFf8d7da));
  }

  static warning(String title, String subtitle){
    show(title, subtitle, Color(0xFFfff3cd));
  }

  static info(String title, String subtitle){
    show(title, subtitle, Color(0xFFd1ecf1));
  }

  static light(String title, String subtitle){
    show(title, subtitle, Color(0xFFfefefe));

  }

  static dark(String title, String subtitle){
    show(title, subtitle, Color(0xFFd6d8d9));
  }

}