import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendz/Helpers/colors.dart';
import 'package:trendz/Views/login_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Timer(const Duration(seconds: 5), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) =>  LoginScreen()));
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: darkbg,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 2,
                width: 100,
                color: Colors.white,
              ),
              const SizedBox(
                height: 40,
              ),
              Text(
                'TREND-Z',
                style: GoogleFonts.josefinSans(
                  textStyle: const TextStyle(
                      color: Colors.white,
                      letterSpacing: 15,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                height: 2,
                width: 100,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
