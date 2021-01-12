import 'package:get/get.dart';
import 'package:barberapp/app/modules/ratings/controllers/ratings_controller.dart';

class RatingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RatingsController>(
      () => RatingsController(),
    );
  }
}
