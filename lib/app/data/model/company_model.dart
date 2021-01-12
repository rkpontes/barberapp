import 'service_model.dart';

class Company {
  int id;
  String name;
  String address;
  String latitude;
  String longitude;
  String phone;
  String socialLink;
  String image;
  List<Service> services;

  Company(
      {this.id,
      this.name,
      this.address,
      this.latitude,
      this.longitude,
      this.phone,
      this.socialLink,
      this.image,
      this.services});

  Company.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    address = json['address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    phone = json['phone'];
    socialLink = json['social_link'];
    image = json['image'];
    if (json['services'] != null) {
      services = new List<Service>();
      json['services'].forEach((v) {
        services.add(new Service.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['address'] = this.address;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['phone'] = this.phone;
    data['social_link'] = this.socialLink;
    data['image'] = this.image;
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}