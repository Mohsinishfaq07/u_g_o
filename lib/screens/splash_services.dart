import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:u_g_o/screens/login/login_screen.dart';

class SplashServices {
  void isLogin(BuildContext context) {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if (user != null) {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    } else {
      Future.delayed(const Duration(seconds: 4), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
    }
  }
}
