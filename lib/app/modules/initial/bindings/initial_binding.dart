import 'package:barberapp/app/modules/initial/controllers/initial_controller.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InitialController>(() => InitialController());
  }
}
