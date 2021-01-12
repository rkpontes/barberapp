import 'package:flutter/material.dart';
import 'package:get/get.dart'; 
import 'package:barberapp/app/modules/service/controllers/service_controller.dart';

class ServiceView extends GetView<ServiceController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ServiceView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'ServiceView is working', 
          style: TextStyle(fontSize:20),
        ),
      ),
    );
  }
}
  