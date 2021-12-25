import 'dart:ui';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trendz/Controllers/logincontroller.dart';

import 'otp_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FirebaseAuth auth = FirebaseAuth.instance;
  bool _password = true;
  bool phonelogin = false;
  final TextEditingController phonecontroller = TextEditingController();

  bool isemail = false;

  @override
  void initState() {
    super.initState();
    _password = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(resizeToAvoidBottomInset: false, body: login());
  }

  Widget login() {
    return Container(
      color: Colors.white,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
        child: Padding(
          padding: const EdgeInsets.only(top: 75.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Spacer(),
              Text(
                "TREND - Z",
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30,
                      letterSpacing: 2),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "Login / Signup",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16,
                      letterSpacing: 0),
                ),
              ),
              const SizedBox(height: 10),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blueGrey[50]),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: TextFormField(
                      onChanged: (String? value) {
                        setState(() {
                          phonecontroller.text.isEmpty
                              ? phonelogin = false
                              : phonelogin = true;
                        });
                      },
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2),
                      cursorColor: Colors.black,
                      controller: phonecontroller,
                      decoration: InputDecoration(
                          prefixText: isemail ? '' : "+91",
                          hintText:
                              isemail ? 'Enter Email ' : 'Enter Phone Number',
                          hintStyle: TextStyle(
                              letterSpacing: 1,
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.blueGrey[900]),
                          enabledBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.transparent))),
                    ),
                  ),
                ),
              ),
              phonelogin
                  ? GestureDetector(
                      onTap: () async {
                        isemail ? print("email") : print("Phonemethod");
                        try {
                          Provider.of<LoginController>(context, listen: false)
                              .verifyPhone(
                                  "+91", phonecontroller.text.toString())
                              .then((value) {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (_) {
                              return const OTPScreen();
                            }));
                          }).catchError((e) {
                            String errorMsg =
                                'Cant Authenticate you, Try Again Later';
                            if (e.toString().contains(
                                'We have blocked all requests from this device due to unusual activity. Try again later.')) {
                              errorMsg =
                                  'Please wait as you have used limited number request';
                            }
                            print(e);
                          });
                        } catch (e) {
                          print(e);
                        }
                      },
                      child: const CircleAvatar(
                        radius: 30,
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.white,
                        ),
                        backgroundColor: Colors.black,
                      ),
                    )
                  : GestureDetector(
                      onTap: () {
                        setState(() {
                          isemail = !isemail;
                        });
                      },
                      child: Text(isemail ? "Use Phone Number" : "Use Email",
                          style: GoogleFonts.montserrat(
                            textStyle: const TextStyle(
                              decoration: TextDecoration.underline,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              fontSize: 16,
                              letterSpacing: 0,
                            ),
                          )),
                    ),
              const Spacer(),
              Column(
                children: [
                  Text(
                    "Or Continue with Social Account",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          fontSize: 13,
                          letterSpacing: 0.5),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          LoginController().fblogin();
                        },
                        child: const Image(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/128/733/733547.png"),
                          height: 30,
                        ),
                      ),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                        onTap: () {
                          LoginController().signInWithGoogle();
                        },
                        child: const Image(
                          image: NetworkImage(
                              "https://cdn-icons-png.flaticon.com/128/2702/2702602.png"),
                          height: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "By Getting into, I agree to ",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black38,
                          fontSize: 12,
                          letterSpacing: 0),
                    ),
                  ),
                  Text(
                    "Terms & Conditions",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.blue.shade600,
                          fontSize: 12,
                          letterSpacing: 0),
                    ),
                  ),
                  const SizedBox(
                    height: 60,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
