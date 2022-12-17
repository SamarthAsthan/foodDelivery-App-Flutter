// To parse this JSON data, do
//
//     final sellerPage = sellerPageFromJson(jsonString);

import 'dart:convert';

SellerPage sellerPageFromJson(String str) =>
    SellerPage.fromJson(json.decode(str));

String sellerPageToJson(SellerPage data) => json.encode(data.toJson());

class SellerPage {
  SellerPage({
    required this.index,
    required this.name,
    required this.location,
    required this.email,
    required this.photo,
    required this.items,
  });

  int index;
  String name;
  String location;
  String email;
  String photo;
  List<Item> items;

  factory SellerPage.fromJson(Map<String, dynamic> json) => SellerPage(
        index: json["index"],
        name: json["name"],
        location: json["location"],
        email: json["email"],
        photo: json["photo"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "index": index,
        "name": name,
        "location": location,
        "email": email,
        "photo": photo,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.name,
    required this.price,
    required this.description,
    required this.photo,
    required this.sellerId,
  });

  String name;
  int price;
  String description;
  String photo;
  int sellerId;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        price: json["price"],
        description: json["description"],
        photo: json["photo"],
        sellerId: json["seller_id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "description": description,
        "photo": photo,
        "seller_id": sellerId,
      };
}
