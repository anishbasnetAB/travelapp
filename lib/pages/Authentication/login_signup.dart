import 'package:a/pages/Authentication/login.dart';
import 'package:a/pages/Authentication/signup.dart';
import 'package:a/widgets/app_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';

class LoginSignup extends StatelessWidget {
  const LoginSignup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
          right: 5,
          top: -80,
          left: -370,
          bottom: MediaQuery.of(context).size.height - 100,
          child: Container(
            height: 200,
            width: 120,
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 135, 81, 198).withOpacity(0.7),
                shape: BoxShape.circle
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30),
                //     bottomRight: Radius.circular(30))
                ),
          ),
        ),
        Positioned(
          right: -40,
          top: -20,
          bottom: MediaQuery.of(context).size.height - 80,
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                color: AppColors.themeColorOrange.withOpacity(0.7),
                shape: BoxShape.circle
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30),
                //     bottomRight: Radius.circular(30))
                ),
          ),
        ),
        Positioned(
          left: 140,
          bottom: -120,
          child: Container(
            height: 200,
            width: 120,
            decoration: BoxDecoration(
                color: AppColors.themeColorYellow, shape: BoxShape.circle
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30),
                //     bottomRight: Radius.circular(30))
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Container(
              height: 400,
              width: 600,
              //color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage("assets/images/applogo.png")),
                  //AppLargeText(text: "Batuwa"),
                  AppText(
                    text: "Your Trekking Guide",
                    size: 22,
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [
                              AppColors.themeColorLight,
                              AppColors.themeColorDark,

                              // Color.fromARGB(255, 37, 166, 110),
                              // Color.fromARGB(255, 159, 226, 122),
                            ],
                          ),
                          color: AppColors.themeColorBlue,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => SignUpScreen()));
                    },
                    child: Container(
                      height: 50,
                      width: 200,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.topLeft,
                            colors: [
                              AppColors.themeColorDark,
                              AppColors.themeColorLight
                              // Color.fromARGB(255, 159, 226, 122),
                              // Color.fromARGB(255, 37, 166, 110),
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset:
                                  Offset(0, 2), // changes position of shadow
                            ),
                          ],
                          color: Color.fromARGB(255, 47, 55, 47),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          )),
                      child: Center(
                        child: Text(
                          "Sign UP",
                          style: TextStyle(
                              fontSize: 23,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
