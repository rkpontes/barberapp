class Employee {
  int id;
  String firstName;
  String lastName;
  String image;
  int companyId;
  int userId;

  Employee(
      {this.id,
      this.firstName,
      this.lastName,
      this.image,
      this.companyId,
      this.userId});

  Employee.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    image = json['image'];
    companyId = json['company_id'];
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['image'] = this.image;
    data['company_id'] = this.companyId;
    data['user_id'] = this.userId;
    return data;
  }
}