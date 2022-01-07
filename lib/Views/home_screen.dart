import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:trendz/Controllers/logincontroller.dart';
import 'package:trendz/Views/search_screen.dart';
import 'package:trendz/models/user_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selecteditem = 0;
  PageController pageController = PageController();
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Provider.of<LoginController>(context);
    return Scaffold(
      drawer: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          children: [
            const SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  Text(
                    "TREND - Z",
                    style: GoogleFonts.josefinSans(
                      textStyle: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                          fontSize: 18,
                          letterSpacing: 2),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.clear),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      const SizedBox(width: 30),
                      Text(
                        "Shop By",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 15,
                              letterSpacing: 0),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Expanded(
                    child: Container(
                      child: Container(),
                      width: MediaQuery.of(context).size.width - 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                    ),
                  )
                ],
              ),
              color: Colors.blue[100]!.withOpacity(0.2),
            ))
          ],
        ),
      ),
      bottomNavigationBar: Row(children: [
        navbaritem(Icons.home, Icons.home_outlined, 0),
        navbaritem(Icons.store, Icons.storefront, 1),
        navbaritem(Icons.account_circle, Icons.account_circle_outlined, 2),
        navbaritem(Icons.favorite, Icons.favorite_outline, 3),
        navbaritem(Icons.shopping_bag, Icons.shopping_bag_outlined, 4)
      ]),
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.black),
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
          // loginController
          //     .setusermodel(FirebaseAuth.instance.currentUser)!
          //     .email
          //     .toString(),
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
      body: PageView(
        controller: pageController,
        children: [
          homescreen(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.purple,
          ),
          Container(
            color: Colors.grey,
          )
        ],
      ),
    );
  }

  Container homescreen() {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Container(
            height: 80,
            child: Center(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => const SearchScreen()));
                },
                child: Container(
                  height: 50,
                  child: Row(
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20),
                        child: Icon(Icons.search),
                      ),
                      Text(
                        "Search by products , brands & more",
                        style: GoogleFonts.montserrat(
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                              fontSize: 12,
                              letterSpacing: 0),
                        ),
                      ),
                    ],
                  ),
                  width: MediaQuery.of(context).size.width - 40,
                  decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(7)),
                ),
              ),
            ),
            color: Colors.blue[100]!.withOpacity(0.2),
          )
        ],
      ),
    );
  }

  Widget navbaritem(IconData icon, IconData _icon, int index) {
    return InkWell(
      onTap: () {
        setState(() {
          pageController.animateToPage(index,
              duration: const Duration(seconds: 1), curve: Curves.decelerate);
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
