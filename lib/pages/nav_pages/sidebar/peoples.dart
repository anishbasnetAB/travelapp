import 'package:a/widgets/app_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';

class People extends StatefulWidget {
  String username;
  String email;
  String firstname;
  String lastname;

  People(
      {required this.email,
      required this.firstname,
      required this.lastname,
      required this.username});

  @override
  State<People> createState() => PeopleState();
}

class PeopleState extends State<People> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Profile'),
        centerTitle: true,
        backgroundColor: AppColors.themeColorLight,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(25),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage("assets/images/user.png"),
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            AppText(
              text: 'Full Name: ${widget.firstname} ${widget.lastname}',
              size: 20,
              color: Color.fromARGB(255, 46, 46, 46),
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              text: 'Username: ${widget.username}',
              size: 20,
              color: Color.fromARGB(255, 46, 46, 46),
            ),
            SizedBox(
              height: 10,
            ),
            AppText(
              text: 'Email: ${widget.email}',
              size: 20,
              color: Color.fromARGB(255, 46, 46, 46),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
