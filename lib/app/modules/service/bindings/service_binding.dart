import 'package:get/get.dart';
import 'package:barberapp/app/modules/service/controllers/service_controller.dart';

class ServiceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ServiceController>(
      () => ServiceController(),
    );
  }
}
