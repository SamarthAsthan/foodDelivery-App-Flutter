// To parse this JSON data, do
//
//     final userOrders = userOrdersFromJson(jsonString);

import 'dart:convert';

UserOrders userOrdersFromJson(String str) =>
    UserOrders.fromJson(json.decode(str));

String userOrdersToJson(UserOrders data) => json.encode(data.toJson());

class UserOrders {
  UserOrders({
    required this.orders,
  });

  List<Order> orders;

  factory UserOrders.fromJson(Map<String, dynamic> json) => UserOrders(
        orders: List<Order>.from(json["orders"].map((x) => Order.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "orders": List<dynamic>.from(orders.map((x) => x.toJson())),
      };
}

class Order {
  Order({
    required this.seller,
    required this.price,
    required this.tax,
    required this.discount,
    required this.totalPrice,
    required this.userId,
    required this.items,
  });

  String seller;
  double price;
  double tax;
  double discount;
  double totalPrice;
  int userId;
  List<Item> items;

  factory Order.fromJson(Map<String, dynamic> json) => Order(
        seller: json["seller"],
        price: json["price"],
        tax: json["tax"],
        discount: json["discount"],
        totalPrice: json["total_price"],
        userId: json["user_id"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "seller": seller,
        "price": price,
        "tax": tax,
        "discount": discount,
        "total_price": totalPrice,
        "user_id": userId,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
      };
}

class Item {
  Item({
    required this.name,
    required this.price,
    required this.quantity,
    required this.isveg,
  });

  String name;
  double price;
  int quantity;
  bool isveg;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
        name: json["name"],
        price: json["price"],
        quantity: json["quantity"],
        isveg: json["isveg"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "price": price,
        "quantity": quantity,
        "isveg": isveg,
      };
}
