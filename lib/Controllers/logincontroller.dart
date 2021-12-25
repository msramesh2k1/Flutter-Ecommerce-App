import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:trendz/models/user_model.dart';

class LoginController extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String verificationId = '';

  UserModel? setusermodel(User? user) {
    if (user != null) {
      setData(user);
      return UserModel(uid: user.uid, email: user.email);
    } else {
      return null;
    }
    // UserModel _usermodel = UserModel(uid:user.uid ,email: user.email);
    // return user != null ? UserModel(uid: user.uid, email: user.email) : null;
  }

  void setData(User user) {
    FirebaseFirestore.instance.collection("users").doc(user.uid).set({
      "uid": user.uid,
      "email": user.email,
      "phonenumber": user.phoneNumber,
      "profile_picture": user.photoURL,
      "name": user.displayName,
    });
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

  Future<void> verifyPhone(String countryCode, String mobile) async {
    var mobileToSend = mobile;

    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: "+917010862331",
          codeAutoRetrievalTimeout: (String verId) {
            this.verificationId = verId;
            //Starts the phone number verification process for the given phone number.
            //Either sends an SMS with a 6 digit code to the phone number specified, or sign's the user in and [verificationCompleted] is called.
            // this.verificationId = verId;
          },
          codeSent: (String verId, [int? forceCodeResend]) {
            this.verificationId = verId;
          },
          timeout: const Duration(
            seconds: 120,
          ),
          verificationCompleted: (AuthCredential phoneAuthCredential) {
            print(phoneAuthCredential);
          },
          verificationFailed: (FirebaseAuthException exceptio) {
            print(exceptio);
            throw exceptio;
          });
    } catch (e) {
      throw e;
    }
  }

  Future<void> verifyOTP(String otp) async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId,
        smsCode: otp,
      );
      final UserCredential result =
          await _auth.signInWithCredential(credential);
      User? user = result.user;
      setusermodel(user);
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  showError(error) {
    throw error.toString();
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
      setusermodel(user);
      notifyListeners();
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
      setusermodel(user);
      notifyListeners();
    } else {
      print(result.status);
      print(result.message);
    }
  }

  Future signout() async {
    try {
      await _auth.signOut();
      notifyListeners();
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future fblogout() async {
    await FacebookAuth.i.logOut();
    notifyListeners();
  }
}
