import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:barberapp/app/data/provider/employee.provider.dart';
import 'package:get/get.dart';

class EmployeeRepository {
  final EmployeeApiClient apiClient = Get.find<EmployeeApiClient>();

  Future<List<Schedule>> getAll() async{
    List<Schedule> list = <Schedule>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        list.add(Schedule.fromJson(e));
      });
    }

    return list;
  }
}
