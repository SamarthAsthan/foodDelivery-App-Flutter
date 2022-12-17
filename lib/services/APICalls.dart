import 'dart:convert';

import 'package:fooddelivery/constants.dart';
import 'package:fooddelivery/models/home_model.dart';
import 'package:fooddelivery/models/seller_page_model.dart';
import 'package:fooddelivery/models/user_orders_model.dart';
import 'package:http/http.dart' as http;

Future sendLoginData(name, email, loginToken, notificationToken) async {
  var response = await http.post(Uri.parse(
      "$baseUrl/auth?name=$name&email=$email&login_token=$loginToken&reg_no=11&notification_token=$notificationToken"));
  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    return result["result"];
  } else {
    return "failed";
  }
}

Future<Welcome> GetHomeData() async {
  final url = "$baseUrl/home/items";
  final reponse = await http.get(Uri.parse(url));
  final body = reponse.body;
  final welcome = welcomeFromJson(body);
  //print(welcome.sellers[1].index);
  return welcome;
}

Future<UserOrders> GetUserOrderData() async {
  final url = "$baseUrl/user/getuser/1";
  final reponse = await http.get(Uri.parse(url));
  final body = reponse.body;
  final userOrders = userOrdersFromJson(body);
  //print(userOrders);
  return userOrders;
}

Future<SellerPage> GetSellerPageData(seller_id) async {
  final url = "$baseUrl/seller/getseller/$seller_id";
  final reponse = await http.get(Uri.parse(url));
  final body = reponse.body;
  final sellerPage = sellerPageFromJson(body);
  //print(sellerPage);
  return sellerPage;
}
