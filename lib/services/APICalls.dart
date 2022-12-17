import 'dart:convert';

import 'package:fooddelivery/models/home_model.dart';
import 'package:fooddelivery/models/user_orders_model.dart';
import 'package:http/http.dart' as http;

Future sendLoginData(name, email, loginToken, notificationToken) async {
  var response = await http.post(Uri.parse(
      "http://3.110.122.84/auth?name=$name&email=$email&login_token=$loginToken&reg_no=11&notification_token=$notificationToken"));
  if (response.statusCode == 200) {
    var result = json.decode(response.body);
    //print(result["result"]);
    return result["result"];
  } else {
    return "failed";
  }
}

Future<Welcome> GetHomeData() async {
  final url = "http://3.110.122.84/home/items";
  final reponse = await http.get(Uri.parse(url));
  final body = reponse.body;
  final welcome = welcomeFromJson(body);
  //print(welcome.items[1].name);
  return welcome;
}

Future<UserOrders> GetUserOrderData() async {
  final url = "http://3.110.122.84/user/getuser/1";
  final reponse = await http.get(Uri.parse(url));
  final body = reponse.body;
  final userOrders = userOrdersFromJson(body);
  print(userOrders);
  return userOrders;
}
