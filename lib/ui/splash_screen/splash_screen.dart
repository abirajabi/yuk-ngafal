import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:yuk_ngafal/auth/auth.dart';
import 'package:get/get.dart';
import 'package:yuk_ngafal/common/color_style.dart';
import 'package:yuk_ngafal/common/text_style.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    initializeUser();
    navigateUser();
  }

  Future initializeUser() async {
    await Firebase.initializeApp();
    final User? firebaseUser = FirebaseAuth.instance.currentUser;
    await firebaseUser!.reload();
    _user = (_auth.currentUser)!;
  }

  navigateUser() async {
    if (_auth.currentUser != null) {
      Timer(const Duration(seconds: 3), () {
        Get.offNamed('/home', arguments: _user);
      });
    } else {
      Timer(const Duration(seconds: 4), () {
        Get.offNamed('/login');
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: celticBlue,
        body: Center(
          child: Image.asset(
            'assets/logo.png',
          ),
        ),
      ),
    );
  }
}
