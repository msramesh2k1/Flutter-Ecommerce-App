import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:trendz/Controllers/logincontroller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                LoginController().signout();
              },
              icon: const Icon(
                Icons.logout,
                color: Colors.black,
              ))
        ],
        title: Text(
          "TREND - Z",
          style: GoogleFonts.josefinSans(
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
                letterSpacing: 2),
          ),
        ),
        backgroundColor: Colors.blue[100]!.withOpacity(0.2),
        elevation: 0,
      ),
    );
  }
}
