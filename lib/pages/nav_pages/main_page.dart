import 'package:a/pages/nav_pages/home_page.dart';
import 'package:a/pages/nav_pages/packages/packages.dart';
import 'package:a/pages/nav_pages/sidebar/pages/search/user_list.dart';
import 'package:a/pages/nav_pages/trek_guides.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class MainPage extends StatefulWidget {
  // final userList;

  // MainPage({required this.userList});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var a;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();

  // }

  List pages = [
    HomePage(),
    BarItemPage(),
    GuidePage(),
  ];
  int currentIndex = 0;

  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    print("new");

    return Scaffold(
      // backgroundColor: Color.fromARGB(179, 12, 11, 11),
      body: pages[currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 55,
        // color: Color.fromARGB(255, 37, 166, 110),
        // Color.fromARGB(255, 159, 226, 122)
        // color: AppColors.themeColorDark,
        color: Color.fromARGB(255, 96, 228, 199),
        buttonBackgroundColor: Color.fromARGB(255, 96, 228, 199),

        //selectedItemColor: Colors.green,
        backgroundColor: Colors.white,
        onTap: onTap,
        // currentIndex: currentIndex,
        items: <Widget>[
          Icon(
            Icons.home,
            color: Color.fromARGB(255, 0, 0, 0),
            size: 25,
          ),
          Icon(
            Icons.card_giftcard,
            size: 25,
          ),
          Icon(
            Icons.person,
            size: 25,
            //semanticLabel: "t",
          ),
        ],
      ),
    );
  }
}

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: pages[currentIndex],
  //     bottomNavigationBar: BottomNavigationBar(
  //         // // to not shift the icons
  //         // type: BottomNavigationBarType.fixed,
  //         // backgroundColor: Colors.white,
  //         onTap: onTap,
  //         currentIndex: currentIndex,
  //         selectedItemColor: Colors.green,
  //         unselectedItemColor: Colors.green.shade300,
  //         showUnselectedLabels: false,
  //         showSelectedLabels: true,
  //         selectedFontSize: 15,
  //         unselectedFontSize: 0,
  //         elevation: 0,
  //         backgroundColor: Colors.green.shade100.withOpacity(0.6),
  //         items: [
  //           BottomNavigationBarItem(
  //               label: "home",
  //               icon: Icon(
  //                 Icons.home,
  //                 // color: Colors.green,
  //                 size: 30,
  //               )),
  //           BottomNavigationBarItem(
  //               label: "Trek Guide",
  //               icon: Icon(
  //                 Icons.person,
  //                 size: 25,
  //               )),
  //           BottomNavigationBarItem(
  //               label: "Packages",
  //               icon: Icon(
  //                 Icons.card_giftcard,
  //                 size: 30,
  //               )),
  //         ]),
  //   );
  // }