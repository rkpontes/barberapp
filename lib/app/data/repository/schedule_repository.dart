import 'package:barberapp/app/data/model/employee_model.dart';
import 'package:barberapp/app/data/model/schedule_model.dart';
import 'package:barberapp/app/data/model/service_model.dart';
import 'package:barberapp/app/data/provider/schedule_provider.dart';
import 'package:get/get.dart';

class ScheduleRepository {
  final ScheduleApiClient apiClient = Get.find<ScheduleApiClient>();

  Future<List<Schedule>> getAll() async{
    List<Schedule> list = <Schedule>[];
    var response = await apiClient.getAll();
    if(response != null){
      response.forEach((e){
        //print(Schedule.fromJson(e).toJson());
        list.add(Schedule.fromJson(e));
      });
    }

    return list;
    
  }

  add(String date, String hourStart, String hourEnd, Employee employee, Service service) async{
    return Schedule.fromJson(await apiClient.add(date, hourStart, hourEnd, employee, service));
  }

  // getId(id) {
  //   return apiClient.getId(id);
  // }

  // delete(id) {
  //   return apiClient.delete(id);
  // }

  // edit(obj) {
  //   return apiClient.edit(obj);
  // }

  // add(obj) {
  //   return apiClient.add(obj);
  // }
}
