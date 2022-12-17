import 'package:firebase_auth/firebase_auth.dart';
import 'package:fooddelivery/services/APICalls.dart';

class loginRequest {
  sendRequest() {
    String email, name, loginToken, notificationToken;
    email = FirebaseAuth.instance.currentUser!.email!;
    name = FirebaseAuth.instance.currentUser!.displayName!;
    loginToken = FirebaseAuth.instance.currentUser!.uid;
    notificationToken = FirebaseAuth.instance.currentUser!.photoURL!;
    sendLoginData(name, email, loginToken, notificationToken);
  }
}
