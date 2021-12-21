import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:provider/provider.dart';

class FacebookLoginController extends ChangeNotifier {
  Map? userdata;
  login() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final requestdata =
      await FacebookAuth.i.getUserData(fields: "name,email,picture,id");

      userdata = requestdata;

      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential credential = FacebookAuthProvider.credential(accessToken.token);
    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);
      
      notifyListeners();
      print(requestdata);

    } else {
      print(result.status);
      print(result.message);
    }
  }

  logout() async {
    await FacebookAuth.i.logOut();
    userdata = null;
    notifyListeners();
  }
}
