import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:fooddelivery/models/sellermodel.dart';
import 'package:http/http.dart' as http;

List<SellersDataModel> newsList = [];
// Fetching Json file.
Future<List<SellersDataModel>> ReadJsonData() async {
  var response =
      await http.get(Uri.parse("http://3.110.122.84/seller/getsellers"));
  if (response.statusCode == 200) {
    var newsList = json.decode(response.body) as List<dynamic>;
    return newsList.reversed.map((e) => SellersDataModel.fromJson(e)).toList();
  } else {
    return newsList;
  }
}
