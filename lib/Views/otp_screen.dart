import 'package:firebase_auth/firebase_auth.dart';
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
  void initState() {
    // TODO: implement initState
    super.initState();

    listenotp();
  }

  String _verificationId = '';
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
              "Verify Details",
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
            const SizedBox(
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
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 0.0, right: 70.0),
              child: PinFieldAutoFill(
                  codeLength: 6,
                  onCodeSubmitted: (String value) async {
                                       try {
                      LoginController().verifyOTP(value).then((_) {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (_) => HomeScreen()));
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
                        print(errorMsg);
                      });
                    } catch (e) {
                      print(e);
                    }
                  },
                  decoration: BoxLooseDecoration(
                    radius: const Radius.circular(4),
                    gapSpace: 20,
                    strokeColorBuilder:
                        PinListenColorBuilder(Colors.blueGrey, Colors.black),
                  )

                  // prefill with a code
                  // onCodeSubmitted: //code submitted callback
                  // onCodeChanged: //code changed callback
                  // codeLength: //code length, default 6
                  ),
            ),

            // Row(
            //   children: [
            //     Container(
            //       height: 60,
            //       width: 40,
            //       child: TextField(),
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(7)),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       height: 60,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(7)),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       height: 60,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(7)),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       height: 60,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(7)),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       height: 60,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(7)),
            //     ),
            //     const SizedBox(
            //       width: 20,
            //     ),
            //     Container(
            //       height: 60,
            //       width: 40,
            //       decoration: BoxDecoration(
            //           color: Colors.grey[200],
            //           borderRadius: BorderRadius.circular(7)),
            //     ),
            //   ],
            // ),
            const SizedBox(
              height: 40,
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

  void listenotp() async {
    await SmsAutoFill().listenForCode();
  }

  Widget _otpTextField(int digit) {
    return new Container(
      width: 35.0,
      height: 45.0,
      alignment: Alignment.center,
      child: new Text(
        digit != null ? digit.toString() : "",
        style: new TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
//            color: Colors.grey.withOpacity(0.4),
          border: Border(
              bottom: BorderSide(
        width: 2.0,
        color: Colors.black,
      ))),
    );
  }
}
