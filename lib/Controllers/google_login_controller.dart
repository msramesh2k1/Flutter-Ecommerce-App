import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSignin extends ChangeNotifier {
  GoogleSignInAccount? _user;
  bool? isloggedin;
  GoogleSignin _googleSignin = GoogleSignin();

  login() {
    _googleSignin.login();
    notifyListeners();
  }
}
