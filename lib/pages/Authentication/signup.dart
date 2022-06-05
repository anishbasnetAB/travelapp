import 'package:a/pages/Authentication/login.dart';
import 'package:a/widgets/app_large_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController firstNameController = TextEditingController();
    TextEditingController lastNameController = TextEditingController();

    void signup(String email, password, firstName, lastName, userName) async {
      try {
        Response response =
            await post(Uri.parse("http://10.0.2.2:8000/register/"), body: {
          'email': userName,
          'password': password,
          'first_name': firstName,
          'last_name': lastName,
          'username': email,
        });
        if (response.statusCode == 200) {
          final text = 'SignUP Successful';
          final snackBar = SnackBar(
            //dismissDirection: DismissDirection.up,
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
              MaterialPageRoute(builder: (context) => LoginScreen()));
        } else if (response.statusCode == 500) {
          print("Server not active");
        } else {
          final text = 'SigUp Failed';
          final snackBar = SnackBar(content: Text(text));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      } catch (e) {
        final text = 'The username/email already exists';
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
      //   } else {
      //     final text = 'SignUp failed';
      //     final snackBar = SnackBar(
      //       content: Text(
      //         text,
      //         style: TextStyle(fontSize: 16),
      //       ),
      //       backgroundColor: Colors.red.shade400,
      //       duration: Duration(seconds: 5),
      //     );
      //     ScaffoldMessenger.of(context).showSnackBar(snackBar);
      //   }
      // } catch (e) {
      //   final text = 'User Name / Email is already taken';
      //   final snackBar = SnackBar(
      //     content: Text(
      //       text,
      //       style: TextStyle(fontSize: 16),
      //     ),
      //     backgroundColor: Colors.red.shade400,
      //     duration: Duration(seconds: 5),
      //   );
      //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
      // }
    }

    return Scaffold(
      key: _scaffoldkey,
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Stack(children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.topLeft,
                  colors: [AppColors.themeColorLight, AppColors.themeColorDark],
                ),

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
                    //  color: Colors.white38,
                    color: AppColors.themeColorLight.withOpacity(0.4),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30))),
              ),
            ),
            Positioned(
              left: 140,

              bottom: -80, // MediaQuery.of(context).size.height - 80,
              child: Container(
                height: 120,
                width: 120,
                decoration: BoxDecoration(
                    color: AppColors.themeColorLight, shape: BoxShape.circle
                    // borderRadius: BorderRadius.only(
                    //     bottomLeft: Radius.circular(30),
                    //     bottomRight: Radius.circular(30))
                    ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Container(
              height: 850,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: SingleChildScrollView(
                        child: Card(
                          // color: Colors.green.shade,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40))),
                          elevation: 10,
                          child: Padding(
                            padding: const EdgeInsets.only(
                                left: 20.0, right: 20, bottom: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 50,
                                  width: 300,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color.fromARGB(
                                                    255, 160, 159, 159)
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
                                    padding: const EdgeInsets.only(
                                        left: 40.0, top: 5),
                                    child: AppLargeText(
                                      text: " SignUp",
                                      color: Colors.white,
                                      size: 33,
                                    ),
                                  ),
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
                                  controller: firstNameController,
                                  decoration: const InputDecoration(
                                      hintText: 'First Name'),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return "Please Enter correct first name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: lastNameController,
                                  decoration: const InputDecoration(
                                      hintText: 'Last Name'),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[a-z A-Z]+$')
                                            .hasMatch(value)) {
                                      return "Please Enter correct last name";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  controller: emailController,
                                  decoration:
                                      InputDecoration(hintText: 'Email'),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}')
                                            .hasMatch(value)) {
                                      return "Please Enter correct Email Address";
                                    } else {
                                      return null;
                                    }
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                    controller: userNameController,
                                    decoration:
                                        InputDecoration(labelText: 'User Name'),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Enter correct user name";
                                      } else {
                                        return null;
                                      }
                                    }),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: true,
                                  controller: passwordController,
                                  decoration:
                                      InputDecoration(hintText: 'Password'),
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                            .hasMatch(value)) {
                                      return "Your password should contain at least one upper case,\n one lower case, one digit, one special character and must\n be longer than 8 characters";
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
                                      signup(
                                        userNameController.text.toString(),
                                        passwordController.text.toString(),
                                        firstNameController.text.toString(),
                                        lastNameController.text.toString(),
                                        emailController.text.toString(),
                                      );
                                      // final text = 'SignUp Successful';
                                      // final snackBar = SnackBar(
                                      //     //dismissDirection: DismissDirection.up,
                                      //     content: Text(
                                      //       text,
                                      //       style: TextStyle(fontSize: 16),
                                      //     ),
                                      //     backgroundColor: Colors.green,
                                      //     duration: Duration(seconds: 5));
                                    }
                                  },
                                  child: Container(
                                    height: 50,
                                    width: 120,
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
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ]),
            ),
          ]),
        ),
      ),
    );
  }
}
