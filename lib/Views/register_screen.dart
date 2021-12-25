import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController namecontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 25.0),
                  child: GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.clear)),
                )
              ],
            ),
            Text(
              "Welcome to Trend - Z",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 0),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  "msramesh2k1@gmail.com",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 15,
                        letterSpacing: 0),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    "Edit",
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue.shade700,
                          fontSize: 15,
                          letterSpacing: 0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 20),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey[50]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                    cursorColor: Colors.black,
                    controller: namecontroller,
                    decoration: InputDecoration(
                        hintText: 'Name',
                        hintStyle: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blueGrey[900]),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.blueGrey[50]),
                child: Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: TextFormField(
                    // textAlign: TextAlign.center,
                    style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2),
                    cursorColor: Colors.black,
                    controller: namecontroller,
                    decoration: InputDecoration(
                        hintText: 'Password',
                        hintStyle: TextStyle(
                            letterSpacing: 1,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.blueGrey[900]),
                        enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent)),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.transparent))),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Gender",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 0),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Container(
                  child: Center(
                    child: Text(
                      "Male",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 0),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  child: Center(
                    child: Text(
                      "Female",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 0),
                      ),
                    ),
                  ),
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
                Container(
                  height: 50,
                  width: 100,
                  child: Center(
                    child: Text(
                      "Other",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black,
                            fontSize: 15,
                            letterSpacing: 0),
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      border: Border.all(
                        color: Colors.black,
                        width: 1,
                      )),
                ),
                const SizedBox(
                  width: 20,
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
            Padding(
                padding: const EdgeInsets.only(left: 0.0, right: 70.0),
                child: Container()),
            const Spacer(),
            const CircleAvatar(
              radius: 30,
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.white,
              ),
              backgroundColor: Colors.black,
            ),
            const SizedBox(
              height: 10,
            )
          ],
        ),
      ),
    );
  }
}
