import 'package:barberapp/app/data/model/employee_model.dart';
import 'package:barberapp/app/data/model/service_model.dart';
import 'package:barberapp/app/data/repository/schedule_repository.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class SchedulesController extends GetxController {
  final formKey = GlobalKey<FormState>();
  Service service = Get.arguments;
  final repository = Get.find<ScheduleRepository>();
  DateTime datePicked;
  TimeOfDay timePicked;
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  Employee employee;
  RxDouble start = 7.0.obs;
  RxDouble end = 20.0.obs;

  void openCalendar() async {
    FocusScope.of(Get.context).requestFocus(new FocusNode());
    datePicked = await showDatePicker(
      context: Get.context,
      initialDate: datePicked ?? DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (datePicked != null && datePicked != DateTime.now()) {
      dateController.text = DateFormat("dd/MM/yyyy")
          .format(DateTime.parse(datePicked.toString()));
    }
  }

  void openClock() async {
    TimeOfDay time = TimeOfDay.now();
    FocusScope.of(Get.context).requestFocus(new FocusNode());
    timePicked = await showTimePicker(
      context: Get.context, 
      initialTime: time,
    );
    if (timePicked != null && timePicked != time) {
      timeController.text = timePicked.format(Get.context);
      time = timePicked;
    }
  }

  void openEmployeePage() {
    //Get.toNamed(Routes.EMPLOYEE);
  }


  void onsave() async{
    if(formKey.currentState.validate()){
      var response = await repository.add(dateController.text, start.value.toStringAsFixed(0), end.value.toStringAsFixed(0), employee, service);
      if(response != null){
        Get.back(result: "OK");
      }
    }
  }

}
