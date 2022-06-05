import 'package:a/models/api_accomodation.dart';
import 'package:a/models/api_destination.dart';
import 'package:a/models/api_transportaion.dart';
import 'package:a/pages/detail_page.dart';
import 'package:a/pages/nav_pages/highlights/adventure.dart';
import 'package:a/pages/nav_pages/highlights/camping.dart';
import 'package:a/pages/nav_pages/highlights/hiking.dart';
import 'package:a/pages/nav_pages/highlights/popular.dart';
import 'package:a/pages/nav_pages/sidebar/navigation_drawer.dart';
import 'package:a/pages/nav_pages/sidebar/pages/search.dart';
import 'package:a/pages/nav_pages/sidebar/pages/search/searchPage.dart';
import 'package:a/services/accomodationApi.dart';
import 'package:a/services/remote_services.dart';
import 'package:a/services/transportationApi.dart';
import 'package:a/widgets/app_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => HomePageState();
}

// var imageUrl = "http://10.0.2.2:8000";
class HomePageState extends State<HomePage> with TickerProviderStateMixin {
  List<ApiDestination>? apiDestinations;
  // var user_data;
  var isLoaded = false;

  var images = {
    "assets/images/story1.png": "Popular",
    "assets/images/story5.png": "Adventure",
    "assets/images/story3.png": "Hiking",
    "assets/images/story6.png": "Camping",
  };
  List pagesHighlites = [
    Popular(),
    Adventure(),
    Hiking(),
    Camping(),
  ];
  var imageUrl = "http://10.0.2.2:8000";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUserData();

    getData();
  }

  // getUserData() async {
  //   final prefs =
  //       await SharedPreferences.getInstance().then((value) => user_data);
  //   prefs.getString('userlist');
  //   print("1");
  //   print(user_data);
  // }

  getData() async {
    apiDestinations = await RemoteServices().getDestinations();
    if (apiDestinations != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("object");
    // print(user_data);
    TabController _tabController = TabController(length: 1, vsync: this);
    return Scaffold(
      drawer: const NavigationDrawer(),
      body: Builder(builder: (context) {
        return Container(
          height: 800,
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 70, left: 20),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
                          },
                          child: Icon(
                            Icons.menu,
                            size: 30,
                          )),
                      SizedBox(
                        width: 290,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SearchDestination(),
                                ));
                          },
                          child: Icon(
                            Icons.search,
                            size: 30,
                          ))
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Container(
                    //margin: const EdgeInsets.only(left: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                      Text(
                        "Discover",
                        style: TextStyle(
                          fontSize: 25,
                          color: Color.fromARGB(255, 62, 62, 62),
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "NEPAL",
                        style: TextStyle(
                            fontSize: 25,
                            color: Color.fromARGB(255, 78, 211, 87),
                            fontWeight: FontWeight.bold),
                      ),
                    ])),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  height: 120,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 4, //makes 4 items
                      itemBuilder: (_, index) {
                        //builds by index value
                        return Container(
                          margin: const EdgeInsets.only(right: 30),
                          child: Column(
                            children: [
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            pagesHighlites[index])),
                                child: Container(
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color.fromARGB(255, 196, 228, 220),
                                    image: DecorationImage(
                                      image: AssetImage(images.keys.elementAt(
                                          index)), //image location which is stores in map
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Container(
                                child: AppText(
                                  text: images.values.elementAt(index),
                                  color: AppColors.textColor3,
                                ),
                              )
                            ],
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Container(
                    child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.black,
                        unselectedLabelColor: Colors.black54,
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.label,
                        tabs: const [
                          Tab(
                            child: Text("Destination",
                                style: TextStyle(
                                    fontFamily: "BarlowBold",
                                    color: Color.fromARGB(255, 52, 52, 52),
                                    fontSize: 20)),
                          ),
                        ]),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 15),
                  height: 350,
                  width: 400,
                  //color: Colors.amber,
                  child: Container(
                    height: 400,
                    width: double.infinity,
                    child: ListView.builder(
                      itemCount: apiDestinations?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Column(
                                  children: [
                                    GestureDetector(
                                      onTap: (() {
                                        // Navigator.push(
                                        //     context,
                                        // MaterialPageRoute(
                                        //     builder: (context) => DetailPageTest(
                                        //         titile: ApiDestination
                                        //             .destinationName
                                        //             .elementAt(index),
                                        //         image: ApiDestination[index]
                                        //             ['destinationName'],
                                        //         location: ApiDestination[index]
                                        //             ['destinationName'])));
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DetailPage(
                                                      detailPage:
                                                          apiDestinations![
                                                              index],
                                                      // title: apiDestinations![index]
                                                      //     .destinationLocation,
                                                    )));
                                      }),
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            right: 19, top: 10),
                                        width: 190,
                                        height: 270,
                                        decoration: BoxDecoration(
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 3,
                                              blurRadius: 3,
                                              offset: const Offset(0,
                                                  2), // changes position of shadow
                                            ),
                                          ],
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(20),
                                              topRight: Radius.circular(20)),
                                          color: Colors.white,
                                          image: apiDestinations != null
                                              ? DecorationImage(
                                                  image: NetworkImage(imageUrl +
                                                      (apiDestinations !=
                                                                  null &&
                                                              apiDestinations!
                                                                  .isNotEmpty
                                                          ? apiDestinations![
                                                                  index]
                                                              .destinationImage
                                                          : '')),
                                                  fit: BoxFit.cover)
                                              : DecorationImage(
                                                  image: AssetImage(
                                                      "assets/images/loading.png"),
                                                ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 18),
                                      child: Container(
                                        height: 60,
                                        width: 195,
                                        decoration: BoxDecoration(
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                spreadRadius: 2,
                                                blurRadius: 2,
                                                offset: Offset(0,
                                                    1), // changes position of shadow
                                              ),
                                            ],
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        //color: Color.fromARGB(255, 206, 206, 206),
                                        child: Padding(
                                          padding: const EdgeInsets.only(
                                              top: 7,
                                              left: 15,
                                              right: 15,
                                              bottom: 5),
                                          child: SingleChildScrollView(
                                            child: Column(
                                              children: [
                                                apiDestinations != null
                                                    ? Text(
                                                        apiDestinations![index]
                                                            .destinationName,
                                                        style: const TextStyle(
                                                            color:
                                                                Color.fromARGB(
                                                                    255,
                                                                    64,
                                                                    64,
                                                                    64),
                                                            fontSize: 20,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      )
                                                    : CircularProgressIndicator(),
                                                const SizedBox(
                                                  height: 0,
                                                ),
                                                Row(
                                                  // mainAxisAlignment:
                                                  //     MainAxisAlignment.spaceBetween,
                                                  children: [
                                                    const Icon(
                                                      Icons.pin_drop,
                                                      size: 19,
                                                    ),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    apiDestinations != null
                                                        ? Text(
                                                            apiDestinations![
                                                                    index]
                                                                .destinationLocation,
                                                            style:
                                                                const TextStyle(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      65,
                                                                      65,
                                                                      65),
                                                              fontSize: 16,
                                                            ),
                                                          )
                                                        : CircularProgressIndicator(),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ]);
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
