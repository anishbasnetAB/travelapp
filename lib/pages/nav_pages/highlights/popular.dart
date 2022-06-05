import 'dart:ffi';

import 'package:a/pages/nav_pages/main_page.dart';
import 'package:a/widgets/app_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';

class Popular extends StatelessWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColorDark,
        title: Center(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => MainPage())),
              child: Icon(
                Icons.arrow_back,
                color: AppColors.themeColorDark,
              ),
            ),
            Text(
              "Popular Destination",
              style: TextStyle(color: Color.fromARGB(255, 233, 233, 233)),
            ),
            SizedBox(
              width: 30,
            )
          ]),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                    child: Material(
                  child: Container(
                    height: 130,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 20.0,
                          offset: Offset(-18, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://d3hne3c382ip58.cloudfront.net/files/uploads/bookmundi/resized/cms/beautiful-view-of-annapurna-south-from-poon-hill-1528106783-1000X561.jpg"))),
                    ),
                  ),
                ),
                Positioned(
                    left: 145,
                    child: Container(
                      height: 105,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                color: Colors.black,
                                text: "Poonhill Trek",
                                size: 22,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Altitude : 3200 m    "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Location: Annapurna Region "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Days : 7 Days              "),
                            ]),
                      ),
                    )),
              ],
            ),
            //color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                    child: Material(
                  child: Container(
                    height: 130,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 20.0,
                          offset: Offset(-18, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://classichimalaya.com/wp-content/uploads/2015/09/trekking-in-nepal-sherpa-village-trek.jpg"))),
                    ),
                  ),
                ),
                Positioned(
                    left: 145,
                    child: Container(
                      height: 105,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                color: Colors.black,
                                text: "Sherpa Village Trek",
                                size: 20,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Altitude : 2800 m    "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Location: Namche"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Days : 14              "),
                            ]),
                      ),
                    )),
              ],
            ),
            //color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                    child: Material(
                  child: Container(
                    height: 130,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 20.0,
                          offset: Offset(-18, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://heavenhimalaya.com/wp-content/uploads/2020/03/Kanchejunga-Mountain-1190x600.jpg"))),
                    ),
                  ),
                ),
                Positioned(
                    left: 145,
                    child: Container(
                      height: 105,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                color: Colors.black,
                                text: "Kanchenjunga",
                                size: 22,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Altitude : 4500 m    "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Location: Lhonak"),
                              SizedBox(
                                height: 5,
                              ),
                              Text("Days : 23 Days              "),
                            ]),
                      ),
                    )),
              ],
            ),
            //color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                    child: Material(
                  child: Container(
                    height: 130,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 20.0,
                          offset: Offset(-18, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://cdn.tourradar.com/s3/tour/1500x800/171788_b6dfda5e.jpg"))),
                    ),
                  ),
                ),
                Positioned(
                    left: 145,
                    child: Container(
                      height: 105,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                color: Colors.black,
                                text: "Rara Lake Trek",
                                size: 20,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Altitude : 3200 m    "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Location: Rara"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Days : 11              "),
                            ]),
                      ),
                    )),
              ],
            ),
            //color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                    child: Material(
                  child: Container(
                    height: 130,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 20.0,
                          offset: Offset(-18, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://www.mountainkingdoms.com/u/holidays/ganesh-himal-trek/Ganesh_Himal_Trek_2_SMB_330x220.jpeg"))),
                    ),
                  ),
                ),
                Positioned(
                    left: 145,
                    child: Container(
                      height: 105,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                color: Colors.black,
                                text: "Ganesh Himal",
                                size: 22,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Altitude : 4200 m    "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Location: Manaslu "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Days : 12 Days              "),
                            ]),
                      ),
                    )),
              ],
            ),
            //color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            height: 130,
            child: Stack(
              children: [
                Positioned(
                    child: Material(
                  child: Container(
                    height: 130,
                    // color: Colors.red,
                    decoration: BoxDecoration(
                      //color: Colors.white,
                      color: Color.fromARGB(255, 255, 255, 255),
                      borderRadius: BorderRadius.circular(0.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.3),
                          spreadRadius: 4,
                          blurRadius: 20.0,
                          offset: Offset(-18, 10), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                )),
                Positioned(
                  top: 0,
                  left: 10,
                  child: Card(
                    elevation: 10,
                    shadowColor: Colors.grey.withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Container(
                      height: 110,
                      width: 130,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://stingynomads.com/wp-content/uploads/2020/03/Everest-Base-Camp-trek-itinerary-800x533.jpg.webp"))),
                    ),
                  ),
                ),
                Positioned(
                    left: 145,
                    child: Container(
                      height: 105,
                      width: 200,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              AppText(
                                color: Colors.black,
                                text: "Everest Trek",
                                size: 20,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text("Altitude : 5550  m    "),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Location: Everest"),
                              SizedBox(
                                height: 8,
                              ),
                              Text("Days : 13              "),
                            ]),
                      ),
                    )),
              ],
            ),
            //color: Colors.black,
          ),
          SizedBox(
            height: 20,
          ),
        ]),
      ),
    );
  }
}
