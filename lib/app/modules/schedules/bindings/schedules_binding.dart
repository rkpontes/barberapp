import 'package:barberapp/app/data/provider/schedule_provider.dart';
import 'package:barberapp/app/data/repository/schedule_repository.dart';
import 'package:get/get.dart';
import 'package:barberapp/app/modules/schedules/controllers/schedules_controller.dart';

class SchedulesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SchedulesController>(
      () => SchedulesController(),
    );
    Get.lazyPut<ScheduleRepository>(
      () => ScheduleRepository(),
    );
    Get.lazyPut<ScheduleApiClient>(
      () => ScheduleApiClient(),
    );
  }
}
