import 'package:barberapp/app/routes/app_routes.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class InitialController extends GetxController {
  final box = GetStorage('barberapp');
  var auth;

  String verifyAuth(){
    auth = box.read('auth');
    if(auth != null){
      return Routes.HOME;
    }else{
      return Routes.WELCOME;
    }
  }

}