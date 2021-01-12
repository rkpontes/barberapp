import 'package:barberapp/app/global/widgets/bottom_nav_custom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:barberapp/app/modules/home/controllers/home_controller.dart';

import 'widgets/page1.dart';
import 'widgets/page2.dart';
import 'widgets/page3.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Barber App'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Visibility(
              visible: controller.selectedIndex.value == 0,
              child: Page1(),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedIndex.value == 1,
              child: Page2(),
            ),
          ),
          Obx(
            () => Visibility(
              visible: controller.selectedIndex.value == 2,
              child: Page3(),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavCustom(),
    );
  }
}
