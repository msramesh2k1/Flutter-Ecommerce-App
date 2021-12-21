import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  Map? userdata;

  void signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    await FirebaseAuth.instance.signInWithCredential(credential);

    notifyListeners();
  }

  fblogin() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final requestdata =
          await FacebookAuth.i.getUserData(fields: "name,email,picture,id");

      userdata = requestdata;

      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      // Once signed in, return the UserCredential
      await FirebaseAuth.instance.signInWithCredential(credential);

      notifyListeners();
      print(requestdata);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  fblogout() async {
    await FacebookAuth.i.logOut();
    userdata = null;
    notifyListeners();
  }
}
