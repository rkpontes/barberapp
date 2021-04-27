import 'package:barberapp/app/data/repository/employee_repository.dart';
import 'package:get/get.dart';

class EmployeeSchedulesController extends GetxController with StateMixin{

  final repository = Get.find<EmployeeRepository>();
  
  @override
  void onInit() {
    super.onInit();
    loadData();
  }
  
  loadData() async{
    await repository.getAll().then((value){
      change(value, status: RxStatus.success());
    }).catchError((err){
      change(null, status: RxStatus.error('Erro ao receber os dados.'));
    });
  }
  
}
