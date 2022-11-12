import 'dart:convert';

import 'package:api_cache_manager/models/cache_db_model.dart';
import 'package:api_cache_manager/utils/cache_manager.dart';
import 'package:fooddelivery/models/sellermodel.dart';
import 'package:http/http.dart' as http;

List<SellersDataModel> newsList = [];
// Fetching Json file.
Future<List<SellersDataModel>> ReadJsonData() async {

    var response =
        await http.get(Uri.parse("https://mocki.io/v1/87806568-8248-4833-84da-3daf5c189a26"));
    if (response.statusCode == 200) {
      var newsList = json.decode(response.body) as List<dynamic>;
      return newsList.reversed
          .map((e) => SellersDataModel.fromJson(e))
          .toList();
    } else {
      return newsList;
    }
}
