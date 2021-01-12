import 'package:get/get.dart';
import 'package:barberapp/app/modules/company/controllers/company_controller.dart';

class CompanyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompanyController>(
      () => CompanyController(),
    );
  }
}
