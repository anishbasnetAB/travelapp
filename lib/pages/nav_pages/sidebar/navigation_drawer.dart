import 'dart:convert';

import 'package:a/pages/nav_pages/sidebar/drawer_item.dart';
import 'package:a/pages/nav_pages/sidebar/peoples.dart';
import 'package:a/pages/nav_pages/sidebar/pages/search/user_list.dart';
import 'package:a/widgets/app_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NavigationDrawer extends StatefulWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  State<NavigationDrawer> createState() => _NavigationDrawerState();
}

class _NavigationDrawerState extends State<NavigationDrawer> {
  var username;
  var email;
  var firstname;
  var lastname;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();

    getUserData();
  }

  getUserData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      username = prefs.getString('username');
      email = prefs.getString('email');
      firstname = prefs.getString('first_name');
      lastname = prefs.getString('last_name');
    });
  }

  @override
  Widget build(BuildContext context) {
    print("hi ");

    return Drawer(
      child: Material(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 80, 0, 0),
          child: Column(
            children: [
              headerWidget(),
              const SizedBox(
                height: 40,
              ),
              const Divider(
                thickness: 1,
                height: 10,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 20,
              ),
              DrawerItem(
                name: 'Profile',
                icon: Icons.people,
                onPressed: () => onItemPressed(context, index: 0),
              ),
              DrawerItem(
                  name: 'Log out',
                  icon: Icons.logout,
                  onPressed: () => SystemNavigator.pop()),
            ],
          ),
        ),
      ),
    );
  }

  void onItemPressed(BuildContext context, {required int index}) {
    Navigator.pop(context);

    switch (index) {
      case 0:
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => People(
                      username: username,
                      email: email,
                      firstname: firstname,
                      lastname: lastname,
                    )));
        break;
    }
  }

  Widget headerWidget() {
    return Column(
      children: [
        const CircleAvatar(
          radius: 40,
          backgroundImage: AssetImage("assets/images/user.png"),
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppText(
              text: "Welcome, ${firstname}",
              size: 20,
              color: Color.fromARGB(255, 65, 65, 65),
            ),
            // SizedBox(
            //   height: ,
            // ),
            // username != null
            //     ? Text("Username: ${username}",
            //         style: TextStyle(
            //             fontSize: 15, color: Color.fromARGB(255, 30, 30, 30)))
            //     : CircularProgressIndicator(),
            // SizedBox(
            //   height: 10,
            // ),
            // username != null
            //     ? Text("Email: ${email}",
            //         style: TextStyle(
            //             fontSize: 14, color: Color.fromARGB(255, 30, 30, 30)))
            //     : CircularProgressIndicator(),
          ],
        )
      ],
    );
  }
}
