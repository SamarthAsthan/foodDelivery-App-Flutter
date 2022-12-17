import 'dart:ffi';

class SellersDataModel {
  int? id;
  String? name;
  String? photo;
  String? email;
  String? location;

  SellersDataModel({this.id, this.name, this.photo, this.email, this.location});

  SellersDataModel.fromJson(Map<String, dynamic> json) {
    id = json["index"];
    name = json["name"];
    location = json["location"];
    photo = json["photo"];
    email = json["email"];
  }
}
