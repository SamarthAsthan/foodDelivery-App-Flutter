class sellerPage2 {
  String? name;
  String? location;
  String? email;
  String? photo;
  List<Items>? items;

  sellerPage2({this.name, this.location, this.email, this.photo, this.items});

  sellerPage2.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    location = json['location'];
    email = json['email'];
    photo = json['photo'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['location'] = this.location;
    data['email'] = this.email;
    data['photo'] = this.photo;
    if (this.items != null) {
      data['items'] = this.items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  String? name;
  int? price;
  String? description;
  String? photo;
  int? sellerId;

  Items({this.name, this.price, this.description, this.photo, this.sellerId});

  Items.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    description = json['description'];
    photo = json['photo'];
    sellerId = json['seller_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['description'] = this.description;
    data['photo'] = this.photo;
    data['seller_id'] = this.sellerId;
    return data;
  }
}
