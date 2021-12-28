import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trendz/Controllers/logincontroller.dart';
import 'package:trendz/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selecteditem = 1;
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Provider.of<LoginController>(context);
    return Scaffold(
      bottomNavigationBar: Row(children: [
        navbaritem(Icons.home, Icons.home_outlined, 1),
        navbaritem(Icons.store, Icons.storefront, 2),
        navbaritem(Icons.account_circle, Icons.account_circle_outlined, 3),
        navbaritem(Icons.favorite, Icons.favorite_outline, 4),
        navbaritem(Icons.shopping_bag, Icons.shopping_bag_outlined, 5)
      ]),
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
          loginController
              .setusermodel(FirebaseAuth.instance.currentUser)!
              .email
              .toString(),
          // "TREND - Z",
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

  Widget navbaritem(IconData icon, IconData _icon, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          selecteditem = index;
        });
      },
      child: Container(
        height: 60,
        width: MediaQuery.of(context).size.width / 5,
        color: index == selecteditem
            ? Colors.blue[100]!.withOpacity(0.2)
            : Colors.white,
        child: index == selecteditem ? Icon(icon) : Icon(_icon),
      ),
    );
  }
}
