class LoginDataModel {
  String? result;

  LoginDataModel({this.result});

  LoginDataModel.fromJson(Map<String, dynamic> json) {
    result = json["result"];
  }
}
