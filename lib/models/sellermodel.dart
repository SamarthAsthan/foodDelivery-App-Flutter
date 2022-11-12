import 'dart:ffi';

class SellersDataModel {
  int? id;
  String? name;
  String? description;
  String? image;
  String? email;
  bool? is_active;

  SellersDataModel(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.email,
      this.is_active});

  SellersDataModel.fromJson(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    description = json["description"];
    image = json["image"];
    email = json["email"];
    is_active = json["is_active"];
  }
}
