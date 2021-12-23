import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trendz/models/user_model.dart';

class LoginController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  UserModel? setusermodel(User? user) {
    // UserModel _usermodel = UserModel(uid:user.uid ,email: user.email);
    return user != null ? UserModel(uid: user.uid, email: user.email) : null;
  }

  Stream<UserModel?> get user {
    return _auth.authStateChanges().map((User? user) => setusermodel(user));
  }

  Future signIn({String? email, String? password}) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      User? user = result.user;
      return setusermodel(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future signUp({String? email, String? password}) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
          email: email.toString(), password: password.toString());
      User? user = result.user;
      return setusermodel(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      UserCredential result =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = result.user;
      return setusermodel(user);
    } on FirebaseAuthException catch (e) {
      print(e.message);
      return null;
    }
  }

  Future fblogin() async {
    final LoginResult result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.success) {
      final requestdata =
          await FacebookAuth.i.getUserData(fields: "name,email,picture,id");

      final AccessToken accessToken = result.accessToken!;

      final OAuthCredential credential =
          FacebookAuthProvider.credential(accessToken.token);
      // Once signed in, return the UserCredential
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      User? user = userCredential.user;
      return setusermodel(user);
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future signout() async {
    try {
      return await _auth.signOut();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future fblogout() async {
    await FacebookAuth.i.logOut();
  }
}
