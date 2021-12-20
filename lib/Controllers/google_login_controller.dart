import 'package:flutter/cupertino.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleSigninController extends ChangeNotifier {
  GoogleSignInAccount? _user;
  bool? isloggedin;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  login() {
    _googleSignIn.signIn();
    notifyListeners();
  }
}
