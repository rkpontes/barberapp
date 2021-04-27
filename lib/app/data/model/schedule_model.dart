import 'package:barberapp/app/data/model/employee_model.dart';
import 'package:barberapp/app/data/model/service_model.dart';

import 'user_model.dart';

class Schedule {
  int id;
  String schedulingDate;
  String schedulingHour;
  String hourStart;
  String hourEnd;
  int userId;
  int employeeId;
  int serviceId;
  Employee employee;
  Service service;
  User user;

  Schedule(
      {this.id,
      this.schedulingDate,
      this.schedulingHour,
      this.hourStart,
      this.hourEnd,
      this.userId,
      this.employeeId,
      this.serviceId,
      this.employee,
      this.service,
      this.user});

  Schedule.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    schedulingDate = json['scheduling_date'];
    schedulingHour = json['scheduling_hour'];
    hourStart = json['hour_start'];
    hourEnd = json['hour_end'];
    userId = json['user_id'];
    employeeId = json['employee_id'];
    serviceId = json['service_id'];
    employee = json['employee'] != null
        ? new Employee.fromJson(json['employee'])
        : null;
    service = json['service'] != null ? new Service.fromJson(json['service']) : null;
    user = json['user'] != null ? new User.fromJson(json['user']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['scheduling_date'] = this.schedulingDate;
    data['scheduling_hour'] = this.schedulingHour;
    data['hour_start'] = this.hourStart;
    data['hour_end'] = this.hourEnd;
    data['user_id'] = this.userId;
    data['employee_id'] = this.employeeId;
    data['service_id'] = this.serviceId;
    if (this.employee != null) {
      data['employee'] = this.employee.toJson();
    }
    if (this.service != null) {
      data['service'] = this.service.toJson();
    }
    if (this.user != null) {
      data['user'] = this.user.toJson();
    }
    return data;
  }
}