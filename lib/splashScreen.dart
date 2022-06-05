import 'dart:async';

import 'package:a/pages/Authentication/login.dart';
import 'package:a/pages/Authentication/login_signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => LoginSignup()));
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const <Widget>[
              Image(image: AssetImage("assets/images/applogo.png")),
              SizedBox(
                height: 15,
              ),
              SpinKitSpinningLines(
                color: Color.fromARGB(255, 0, 0, 0),
                size: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
