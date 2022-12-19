class SearchModel {
  List<Results>? results;

  SearchModel({this.results});

  SearchModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? price;
  String? name;
  String? photo;
  Null? category;
  int? index;
  String? description;
  int? sellerId;

  Results(
      {this.price,
      this.name,
      this.photo,
      this.category,
      this.index,
      this.description,
      this.sellerId});

  Results.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    name = json['name'];
    photo = json['photo'];
    category = json['category'];
    index = json['index'];
    description = json['description'];
    sellerId = json['seller_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['price'] = this.price;
    data['name'] = this.name;
    data['photo'] = this.photo;
    data['category'] = this.category;
    data['index'] = this.index;
    data['description'] = this.description;
    data['seller_id'] = this.sellerId;
    return data;
  }
}
