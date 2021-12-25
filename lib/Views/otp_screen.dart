
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:trendz/Controllers/logincontroller.dart';
import 'package:trendz/Views/home_screen.dart';

class OTPScreen extends StatefulWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  _OTPScreenState createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           const  SizedBox(
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
              "Verify Details",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 18,
                    letterSpacing: 0),
              ),
            ),
           const  SizedBox(
              height: 30,
            ),
            Text(
              "OTP sent to your Mobile Number",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    fontSize: 15,
                    letterSpacing: 0),
              ),
            ),
           const  SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  "+9170******31",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.grey,
                        fontSize: 15,
                        letterSpacing: 2),
                  ),
                ),
           const      SizedBox(
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
          const   SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 70.0),
              child: PinFieldAutoFill(
                  codeLength: 6,
                  onCodeSubmitted: (String value) async {
               
                    try {
                      Provider.of<LoginController>(context, listen: false)
                          .verifyOTP(value.toString())
                          .then((_) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => const HomeScreen()));
                      }).catchError((e) {
                        String errorMsg =
                            'Cant authentiate you Right now, Try again later!';
                        if (e.toString().contains("ERROR_SESSION_EXPIRED")) {
                          errorMsg = "Session expired, please resend OTP!";
                        } else if (e
                            .toString()
                            .contains("ERROR_INVALID_VERIFICATION_CODE")) {
                          errorMsg = "You have entered wrong OTP!";
                        }
                        print(e.toString());
                      });
                    } catch (e) {
                      print(e.toString());
                    }
                  },
                  decoration: BoxLooseDecoration(
                    radius: const Radius.circular(4),
                    gapSpace: 20,
                    strokeColorBuilder:
                        PinListenColorBuilder(Colors.blueGrey, Colors.black),
                  )

                  
                  ),
            ),

           
            Text(
              "Resend OTP",
              style: GoogleFonts.montserrat(
                textStyle: const TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.black,
                    decoration: TextDecoration.underline,
                    fontSize: 15,
                    letterSpacing: 0.5),
              ),
            ),
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
