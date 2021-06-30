import 'dart:async';

import 'package:flutter/material.dart';
import 'package:it_futurz/Screens/auth_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(
      Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => AuthScreen(),
        ),
      ),
    );
    return Scaffold(
      body: Container(
        child: Center(
          child: Image.asset(
            'assets/Logo-1.png',
            width: MediaQuery.of(context).size.width * .6,
          ),
        ),
      ),
    );
  }
}
