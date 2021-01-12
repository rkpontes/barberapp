import 'employee_model.dart';

class Service {
  int id;
  String name;
  String description;
  int cost;
  int companyId;
  List<Employee> employees;

  Service({this.id, this.name, this.description, this.cost, this.companyId, this.employees});

  Service.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    description = json['description'];
    cost = json['cost'];
    companyId = json['company_id'];
    if (json['employees'] != null) {
      employees = new List<Employee>();
      json['employees'].forEach((v) {
        employees.add(new Employee.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['cost'] = this.cost;
    data['company_id'] = this.companyId;
    if (this.employees != null) {
      data['employees'] = this.employees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}