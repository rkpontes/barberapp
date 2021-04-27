import 'package:barberapp/app/data/provider/employee.provider.dart';
import 'package:barberapp/app/data/repository/employee_repository.dart';
import 'package:get/get.dart';

import 'package:barberapp/app/modules/employee_schedules/controllers/employee_schedules_controller.dart';

class EmployeeSchedulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EmployeeSchedulesController>(
      () => EmployeeSchedulesController(),
    );
    Get.lazyPut<EmployeeRepository>(
      () => EmployeeRepository(),
    );
    Get.lazyPut<EmployeeApiClient>(
      () => EmployeeApiClient(),
    );
  }
}
