import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trendz/Views/home_screen.dart';
import 'package:trendz/Views/login_screen.dart';
import 'package:trendz/models/user_model.dart';

class Root extends StatelessWidget {
  const Root({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel?>(context);
    if (user == null) {
      return const  LoginScreen();
    } else {
      return const  HomeScreen();
    }
  }
}
