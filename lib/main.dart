import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendz/Controllers/logincontroller.dart';
import 'package:trendz/models/user_model.dart';

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
        StreamProvider<UserModel?>.value(
          value: LoginController().user,
          initialData: null,
        ),
        ChangeNotifierProvider(
          create: (context) => LoginController(),
        ),
        
      ],
      child: MaterialApp(
          title: 'Trendz', theme: ThemeData(), home: const SplashScreen()),
    );
  }
}
