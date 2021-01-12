import 'employee_model.dart';

class User {
  int id;
  String fullname;
  String username;
  bool image;
  bool activated;
  List<Employee> employees;

  User({this.id, this.fullname, this.username, this.image, this.activated, this.employees});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullname = json['fullname'];
    username = json['username'];
    image = json['image'];
    activated = json['activated'];
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
    data['fullname'] = this.fullname;
    data['username'] = this.username;
    data['image'] = this.image;
    data['activated'] = this.activated;
    if (this.employees != null) {
      data['employees'] = this.employees.map((v) => v.toJson()).toList();
    }
    return data;
  }
}