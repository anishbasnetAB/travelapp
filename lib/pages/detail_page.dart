import 'package:a/location/location.dart';
import 'package:a/models/api_accomodation.dart';
import 'package:a/models/api_destination.dart';
import 'package:a/models/api_transportaion.dart';
import 'package:a/pages/Authentication/login.dart';
import 'package:a/pages/weather/views/weather_main.dart';
import 'package:a/services/accomodationApi.dart';
import 'package:a/services/transportationApi.dart';
import 'package:a/widgets/app_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';

class DetailPage extends StatefulWidget {
  ApiDestination? detailPage;

  DetailPage({required this.detailPage});

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with TickerProviderStateMixin {
  List<ApiAccomodation>? apiAccomodation;
  List<ApiTransportation>? apiTransportation;

  var isLoaded = false;

  var images = {
    "assets/images/story1.png": "Popular",
    "assets/images/story5.png": "Hiking",
    "assets/images/story3.png": "Adventure",
    "assets/images/story6.png": "Camping",
  };

  var imageUrl = "http://10.0.2.2:8000";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getTransportation();
    getAccomodation();
  }

  getTransportation() async {
    apiTransportation = await TransporationServices().getTransportation();
    if (apiTransportation != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  getAccomodation() async {
    apiAccomodation = await AccomodationServices().getAccomodation();
    if (apiAccomodation != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  // var a = images.values.elementAt(index);
  @override
  Widget build(BuildContext context) {
    var latitude = widget.detailPage?.destinationLatitude;
    var longitude = widget.detailPage?.destinationLongitude;
    var size = MediaQuery.of(context).size;
    TabController _tabControll = TabController(length: 3, vsync: this);

    return Scaffold(
      backgroundColor: Color.fromRGBO(255, 255, 255, 1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                width: size.width,
                height: size.height * 0.4,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        //image: AssetImage("assets/images/1.jpg"),
                        image: NetworkImage(
                            "$imageUrl${widget.detailPage?.destinationImage}"),
                        fit: BoxFit.cover)),
              ),
              Container(
                height: 900,
                margin: EdgeInsets.only(top: size.height * 0.36),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Align(
                          child: Container(
                            width: 150,
                            height: 7,
                            decoration: BoxDecoration(
                                color: AppColors.themeColorLight,
                                borderRadius: BorderRadius.circular(10)),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              //  mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 0, left: 20),
                                  child: AppText(
                                      size: 25,
                                      color: Colors.black,
                                      text:
                                          widget.detailPage?.destinationName ??
                                              'nul'),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.location_pin),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    // apiDestinations![index].destinationName
                                    Text(
                                      widget.detailPage?.destinationLocation ??
                                          'nul',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            Column(children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.attach_money_rounded,
                                  ),
                                  AppText(
                                      color: Colors.black,
                                      size: 22,
                                      text: widget
                                              .detailPage?.destinationAvgPrice
                                              .toString() ??
                                          'nul'),
                                  SizedBox(
                                    width: 10,
                                  ),
                                ],
                              ),
                              Text("per person")
                            ]),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 120,
                                //width: double.maxFinite,
                                margin: const EdgeInsets.only(left: 5),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 25),
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: const EdgeInsets.only(right: 50),
                                        width: 50,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              255, 196, 228, 220),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/altitude1.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Column(children: [
                                          AppText(
                                            text: "Altitude",
                                            color: AppColors.textColor3,
                                          ),
                                          AppText(
                                              text:
                                                  "${widget.detailPage?.destinationAltitude} m")
                                        ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 120,
                                //width: double.maxFinite,
                                margin: const EdgeInsets.only(left: 5),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 25),
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: const EdgeInsets.only(right: 50),
                                        width: 50,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              255, 196, 228, 220),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/distance.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Column(children: [
                                          AppText(
                                            text: "Distance",
                                            color: AppColors.textColor3,
                                          ),
                                          AppText(
                                              text:
                                                  "${widget.detailPage?.destinationDistance} Km")
                                        ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 120,
                                //width: 120,
                                //width: double.maxFinite,
                                margin: const EdgeInsets.only(left: 5),
                                child: Container(
                                  margin: const EdgeInsets.only(right: 40),
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: const EdgeInsets.only(right: 50),
                                        width: 50,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              255, 196, 228, 220),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                "assets/images/clock.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Column(children: [
                                          AppText(
                                            text: "Days",
                                            color: AppColors.textColor3,
                                          ),
                                          AppText(
                                            // text: widget.detailPage
                                            //         ?.
                                            //         .toString() ??
                                            //     "a")
                                            text:
                                                "${widget.detailPage?.destinationDays}",
                                          )
                                        ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                height: 120,
                                //width: double.maxFinite,
                                //  margin: const EdgeInsets.only(left: 35),
                                child: Container(
                                  //  margin: const EdgeInsets.only(right: ),
                                  child: Column(
                                    children: [
                                      Container(
                                        // margin: const EdgeInsets.only(right: 50),
                                        width: 50,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color.fromARGB(
                                              255, 196, 228, 220),
                                          image: const DecorationImage(
                                            image: AssetImage(
                                                "assets/images/calender.png"),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        child: Column(children: [
                                          AppText(
                                            text: "Season",
                                            color: AppColors.textColor3,
                                          ),
                                          AppText(
                                              text:
                                                  "${widget.detailPage?.destinationSeason}"),
                                        ]),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 15,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => WeatherScreen(
                                              latitude, longitude)));
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: AppColors.themeColorLight,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text("Live Weather")),
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PolylineTwoScreen()));
                                },
                                child: Container(
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    color: AppColors.themeColorLight,
                                    borderRadius: BorderRadius.circular(8),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 3,
                                        offset: Offset(
                                            0, 2), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  child: Center(child: Text("Start Journey")),
                                ),
                              ),
                            ]),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          child: TabBar(
                              controller: _tabControll,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.black54,
                              isScrollable: true,
                              indicatorSize: TabBarIndicatorSize.label,
                              tabs: [
                                Tab(
                                  child: Text("Overview",
                                      style: TextStyle(
                                          fontFamily: "BarlowBold",
                                          color:
                                              Color.fromARGB(255, 62, 62, 62),
                                          fontSize: 18)),
                                ),
                                Tab(
                                  child: Text("Transportation",
                                      style: TextStyle(
                                          fontFamily: "BarlowBold",
                                          color:
                                              Color.fromARGB(255, 58, 58, 58),
                                          fontSize: 18)),
                                ),
                                Tab(
                                  child: Text("Accomodation",
                                      style: TextStyle(
                                          fontFamily: "BarlowBold",
                                          color: Color.fromARGB(
                                              255, 106, 105, 105),
                                          fontSize: 18)),
                                ),
                              ]),
                        ),
                        Container(
                          padding: const EdgeInsets.only(left: 5, top: 15),
                          height: 500,
                          width: double.infinity,
                          child:
                              TabBarView(controller: _tabControll, children: [
                            Container(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  //mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${widget.detailPage?.destinationDescription}",
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Card(
                                      elevation: 2,
                                      child: AppText(
                                          color: Colors.black,
                                          size: 17,
                                          text:
                                              "Emergency Contact: ${widget.detailPage?.destinationEmergencyDetail}"),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Card(
                                      elevation: 2,
                                      child: AppText(
                                          size: 17,
                                          color: Colors.black,
                                          text:
                                              "Scams Alert: ${widget.detailPage?.destinationScams}"),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Card(
                                      elevation: 2,
                                      child: AppText(
                                        size: 17,
                                        color: Colors.black,
                                        // text:
                                        //     "Equipments Needed: ${widget.detailPage?.destinationEquipment}"),
                                        text:
                                            "Equipment Required: ${widget.detailPage?.destinationEquipment}",
                                      ),
                                    ),
                                    SizedBox(
                                      height: 12,
                                    ),
                                    Card(
                                      elevation: 2,
                                      child: AppText(
                                          size: 17,
                                          color: Colors.black,
                                          text:
                                              "Medicine: ${widget.detailPage?.destinationMedicalNeeds}"),
                                    ),
                                  ]),
                            ),
                            Container(
                                //for accomodation
                                child: ListView.builder(
                                    itemCount: widget
                                        .detailPage?.transportations.length,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Center(
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
                                                    color: Color.fromARGB(
                                                        255, 255, 255, 255),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            0.0),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.3),
                                                        spreadRadius: 4,
                                                        blurRadius: 20.0,
                                                        offset: Offset(-18,
                                                            10), // changes position of shadow
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
                                                  shadowColor: Colors.grey
                                                      .withOpacity(0.5),
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15)),
                                                  child: Container(
                                                    height: 110,
                                                    width: 130,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        image: DecorationImage(
                                                          image: NetworkImage(imageUrl +
                                                              widget
                                                                  .detailPage!
                                                                  .transportations[
                                                                      index]
                                                                  .transportationImage),
                                                        )),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                  left: 145,
                                                  child: Container(
                                                    height: 105,
                                                    width: 200,
                                                    child: Column(children: [
                                                      AppText(
                                                        text: "",
                                                        size: 19,
                                                      ),
                                                      SizedBox(
                                                        height: 15,
                                                      ),
                                                      Text(
                                                          "Service : ${widget.detailPage!.transportations[index].transportationName}"),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                          "Charge : ${widget.detailPage!.transportations[index].transportationPrice}                  "),
                                                      SizedBox(
                                                        height: 8,
                                                      ),
                                                      Text(
                                                          "    Contact : ${widget.detailPage!.transportations[index].transportationContact}              "),
                                                    ]),
                                                  ))
                                            ],
                                          ),
                                          //color: Colors.black,
                                        ),
                                        SizedBox(
                                          height: 15,
                                        ),
                                      ]));
                                    }
                                    //color: Colors.amber,
                                    )),
                            Container(
                              child: ListView.builder(
                                  itemCount:
                                      widget.detailPage?.accomodations.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Center(
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
                                                  color: Color.fromARGB(
                                                      255, 255, 255, 255),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey
                                                          .withOpacity(0.3),
                                                      spreadRadius: 4,
                                                      blurRadius: 20.0,
                                                      offset: Offset(-18,
                                                          10), // changes position of shadow
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
                                                shadowColor: Colors.grey
                                                    .withOpacity(0.5),
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15)),
                                                child: Container(
                                                  height: 110,
                                                  width: 130,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      image: DecorationImage(
                                                        fit: BoxFit.cover,
                                                        image: NetworkImage(imageUrl +
                                                            widget
                                                                .detailPage!
                                                                .accomodations[
                                                                    index]
                                                                .accomodationImage),
                                                      )),
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                left: 145,
                                                child: Container(
                                                  height: 105,
                                                  width: 200,
                                                  child: Column(children: [
                                                    AppText(
                                                      text:
                                                          "${widget.detailPage?.accomodations[index].accomodationName}",
                                                      size: 19,
                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Text(
                                                        "   Location :${widget.detailPage!.accomodations[index].accomodationLocation}                  "),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                        "   Charge : ${widget.detailPage!.accomodations[index].accomodationPrice}                  "),
                                                    SizedBox(
                                                      height: 8,
                                                    ),
                                                    Text(
                                                        "    Contact : ${widget.detailPage!.accomodations[index].accomodationContact}              "),
                                                  ]),
                                                ))
                                          ],
                                        ),
                                        //color: Colors.black,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ]));
                                  }),
                              //color: Colors.amber,
                            ),
                          ]),
                        ),
                      ]),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
