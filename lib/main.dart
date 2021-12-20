import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendz/Controllers/facebook_login_controller.dart';
import 'package:trendz/Controllers/google_login_controller.dart';

import 'Views/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: GoogleSigninController()),
          ChangeNotifierProvider.value(value: FacebookLoginController())
        ],
        child: MaterialApp(
            title: 'Trendz', theme: ThemeData(), home: const SplashScreen()));
  }
}
