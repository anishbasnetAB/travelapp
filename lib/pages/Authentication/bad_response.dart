import 'package:flutter/material.dart';

class BadResponse extends StatelessWidget {
  const BadResponse({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/images/serverError.png"),
        )),
      )),
    );
  }
}
