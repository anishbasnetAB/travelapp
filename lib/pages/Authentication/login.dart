import 'dart:convert';

import 'package:a/pages/nav_pages/main_page.dart';
import 'package:a/pages/nav_pages/sidebar/pages/search/user_list.dart';
import 'package:a/widgets/app_large_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);
  @override
  State<LoginScreen> createState() => LoginScreenState();
}

class LoginScreenState extends State<LoginScreen> {
  List<UserList>? userDetail;

  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var userInfo;

    void login(String username, password) async {
      final prefs = await SharedPreferences.getInstance();
      try {
        Response response =
            await post(Uri.parse("http://10.0.2.2:8000/login/"), body: {
          'username': username,
          'password': password,
        });
        if (response.statusCode == 200) {
          var userData = jsonDecode(response.body.toString());
          userInfo = userData;
          print(userData[
              'access_token']); //Prints access token from the API if the login is valid
          print(userData['email']);
          print(userData['username']);
          print(userData);
          const text = 'Login Successful';
          final snackBar = SnackBar(
            content: Text(
              text,
              style: TextStyle(fontSize: 16),
            ),
            backgroundColor: AppColors.decoration3,
            duration: Duration(seconds: 5),
          );
          ScaffoldMessenger.of(context).showSnackBar(
            snackBar,
          );
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => MainPage()));
          await prefs.setString('username', userData['username']);
          await prefs.setString('email', userData['email']);
          await prefs.setString('first_name', userData['first_name']);
          await prefs.setString('last_name', userData['last_name']);
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => MainPage()),
          // );
          userDetail?.add(UserList.fromJson(userData));
          print(userDetail);
        } else if (response.statusCode == 500) {
          print("Server not active");
        } else {
          final text = 'Login Failed';
          final snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final text = 'Invalid Username or Password';
        final snackBar = SnackBar(
          content: Text(
            text,
            style: TextStyle(fontSize: 16),
          ),
          backgroundColor: Colors.red.shade400,
          duration: Duration(seconds: 5),
        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      key: _scaffoldkey,
      //  backgroundColor: Colors.green.s,
      body: Form(
        key: formkey,
        child: Stack(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [
                    AppColors.themeColorLight,
                    AppColors.themeColorDark
                    // Color.fromARGB(255, 37, 166, 110),
                    // Color.fromARGB(255, 159, 226, 122),
                  ],
                ),
                //color: AppColors.themeColorLight.withOpacity(0.4)

                // shape: BoxShape.circle
                // borderRadius: BorderRadius.only(
                //     bottomLeft: Radius.circular(30),
                //     bottomRight: Radius.circular(30))
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              //bottom: 700,
              child: Container(
                height: 70,
                width: 40,
                decoration: BoxDecoration(
                    color: AppColors.themeColorLight,
                    //color: Color.fromARGB(255, 212, 227, 212).withOpacity(0.5),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
            ),
            Positioned(
              left: 0,
              top: 0,
              child: Container(
                height: 100,
                width: 50,
                decoration: BoxDecoration(
                    color: AppColors.themeColorLight.withOpacity(0.4),

                    // color: Color.fromARGB(255, 124, 106, 192).withOpacity(0.7),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    )),
              ),
            ),
            Positioned(
              left: 140,

              bottom: -80, // MediaQuery.of(context).size.height - 80,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: AppColors.themeColorDark.withOpacity(0.6),
                    shape: BoxShape.circle
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(30),
                    //     bottomRight: Radius.circular(30))
                    ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Center(
                child: Container(
                  height: 510,
                  //  width: 500,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Card(
                        // color: Colors.green.shade,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(40))),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 20.0, right: 20, bottom: 20),
                          child: Column(
                            // crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 50,
                                width: 900,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                          color:
                                              Color.fromARGB(255, 160, 159, 159)
                                                  .withOpacity(0.5),
                                          spreadRadius: 5,
                                          blurRadius: 3,
                                          // offset: Offset(0, -4),
                                          blurStyle: BlurStyle.normal
                                          // changes position of shadow
                                          ),
                                    ],
                                    color: AppColors.themeColorDark,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(30),
                                      bottomRight: Radius.circular(30),
                                      topLeft: Radius.circular(7),
                                      topRight: Radius.circular(7),
                                    )),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 40.0, top: 5),
                                  child: AppLargeText(
                                    text: "Login",
                                    color: Colors.white,
                                    size: 35,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 170,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/appLoginLogo.jpg"),
                                    // colorFilter: new ColorFilter.mode(
                                    //     Colors.black.withOpacity(0.2), BlendMode.dstATop),
                                    // fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: userNameController,
                                decoration:
                                    InputDecoration(hintText: 'User Name'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "User Name can not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: passwordController,
                                decoration:
                                    InputDecoration(hintText: 'Password'),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Password can not be empty";
                                  } else {
                                    return null;
                                  }
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (formkey.currentState!.validate()) {
                                    login(
                                      userNameController.text.toString(),
                                      passwordController.text.toString(),
                                    );
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 3,
                                          offset: Offset(0,
                                              2), // changes position of shadow
                                        ),
                                      ],
                                      color: AppColors.themeColorDark,
                                      //color: Colors.green,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 23,
                                          color: Color.fromARGB(
                                              255, 255, 255, 255),
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
