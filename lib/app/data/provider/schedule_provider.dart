import 'package:barberapp/app/data/model/employee_model.dart';
import 'package:barberapp/app/data/model/service_model.dart';
import 'package:barberapp/app/global/constants.dart';
import 'package:barberapp/app/data/model/auth_model.dart';
import 'package:barberapp/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ScheduleApiClient extends GetConnect{
  final box = GetStorage('barberapp');

  getAll() async {

    String token = Auth.fromJson(box.read('auth')).accessToken;
    var response = await get(baseUrl + "/schedules",
        headers: {"Authorization": 'Bearer ' + token});
    
    if(response.hasError){
      box.erase();
      Get.offAllNamed(Routes.WELCOME);
    }
    
    if (response.statusCode == 200) {
      return response.body;

    } else {
      Get.defaultDialog(
          title: "Error",
          content: Text("${response.body['error']}"));
    }



  }

  add(String date, String hourStart, String hourEnd, Employee employee, Service service) async {
    
    Auth auth = Auth.fromJson(box.read('auth'));
    String token = auth.accessToken;
    int userId = auth.user.id;

    var dt = date.split('/'); // 10/12/2020 => [10, 12, 2020]
    var newDate = dt[2] + '-' + dt[1] + '-' + dt[0] + ' ' + '00:00:00';

    var response = await post(
      baseUrl + "/schedules",
      {
        "scheduling_date": "$newDate",
        "hour_start": "$hourStart",
        "hour_end": "$hourEnd",
        "user_id": "$userId",
        "employee_id": "${employee?.id ?? ''}",
        "service_id": "${service.id}",
      },
      headers: {"Authorization": 'Bearer ' + token},
    );

    if(response.hasError){
      Get.defaultDialog(title: "Error Catch", content: Text("${response.statusText}"));
    }

    if (response.statusCode == 200) {
      return response.body;
    } else {
      Get.defaultDialog(
          title: "Error",
          content: Text("${response.body['error']}"));
      return null;
    }
    
  }
}
