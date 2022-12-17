// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.sellers,
    required this.items,
  });

  List<Seller> sellers;
  List<Item> items;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        sellers:
            List<Seller>.from(json["sellers"].map((x) => Seller.fromJson(x))),
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "sellers": List<dynamic>.from(sellers.map((x) => x.toJson())),
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.photo,
    required this.seller,
  });

  String? name;
  int? price;
  String? description;
  String? photo;
  Seller seller;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        photo: json["photo"],
        seller: Seller.fromJson(json["seller"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "photo": photo,
        "seller": seller.toJson(),
      };
}

class Seller {
  Seller({
    required this.index,
    required this.name,
    required this.location,
    required this.photo,
    required this.email,
  });

  int? index;
  String? name;
  String? location;
  String? photo;
  String? email;

  factory Seller.fromJson(Map<String, dynamic> json) => Seller(
        index: json["index"],
        name: json["name"],
        location: json["location"],
        photo: json["photo"],
        email: json["email"],
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "location": location,
        "photo": photo,
        "email": email,
      };
}
