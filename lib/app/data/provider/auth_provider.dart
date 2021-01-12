import 'package:barberapp/app/global/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthApiClient extends GetConnect{

  Future<Map<String, dynamic>> login(String username, String password) async {
    
    var response = await post(baseUrl + "/login", {"username": username, "password": password});      
    
    print(response.body);
    if(response.statusCode == 200){
      return response.body;
    }else{
      Get.defaultDialog(title: "Login", content: Text("Login/Senha não confere."));
      return null;
    }
    
  }

  Future<Map<String, dynamic>> register(String username, String password) async {

    var response = await post(
      baseUrl + "/register",
      {"username": username, "password": password},
    );
    
    if (response.statusCode == 200) {
      return response.body;

    } else {
      Get.defaultDialog(title: "Cadastro", content: Text("${response.body['message']}"));
      return null;
    }

    
  }
}
