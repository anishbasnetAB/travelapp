import 'package:a/models/api_packages.dart';
import 'package:a/pages/nav_pages/packages/individual_package.dart';
import 'package:a/services/packageApi.dart';
import 'package:a/widgets/app_text.dart';
import 'package:flutter/material.dart';

class BarItemPage extends StatefulWidget {
  BarItemPage({Key? key}) : super(key: key);

  @override
  State<BarItemPage> createState() => _BarItemPageState();
}

class _BarItemPageState extends State<BarItemPage> {
  List<ApiPackages>? apiPackages;

  var isLoaded = false;

  var imageUrl = "http://10.0.2.2:8000";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    apiPackages = await PackageServices().getPackage();
    if (apiPackages != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromARGB(255, 225, 225, 225),
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              "Packages        ",
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
        body: Container(
            child: ListView.builder(
          itemCount: apiPackages?.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => IndividualPackage(
                                        individaulPage: apiPackages![index],

                                        // title: apiDestinations![index]
                                        //     .destinationLocation,
                                      )));
                        },
                        child: Container(
                          height: 300,
                          child: Stack(
                            children: [
                              Positioned(
                                  child: Material(
                                child: Container(
                                  height: 280,
                                  // color: Colors.red,
                                  decoration: BoxDecoration(
                                    //color: Colors.white,
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    borderRadius: BorderRadius.circular(0.0),
                                    boxShadow: [
                                      // color: Colors.white, //background color of box
                                      BoxShadow(
                                        color:
                                            Color.fromARGB(255, 172, 171, 171),
                                        blurRadius: 25.0, // soften the shadow
                                        spreadRadius: 5.0, //extend the shadow
                                        offset: Offset(
                                          15.0, // Move to right 10  horizontally
                                          15.0, // Move to bottom 10 Vertically
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )),
                              Positioned(
                                top: 0,
                                left: 25,
                                child: Card(
                                  elevation: 10,
                                  shadowColor:
                                      Color.fromARGB(255, 160, 160, 160)
                                          .withOpacity(0.5),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Container(
                                      height: 200,
                                      width: 300,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(25),
                                        image: apiPackages != null
                                            ? DecorationImage(
                                                image: NetworkImage(imageUrl +
                                                    (apiPackages != null &&
                                                            apiPackages!
                                                                .isNotEmpty
                                                        ? apiPackages![index]
                                                            .packageImage
                                                        : '')),
                                                fit: BoxFit.cover)
                                            : DecorationImage(
                                                image: AssetImage(
                                                    "assets/images/loading.png"),
                                              ),
                                        // image: DecorationImage(
                                        //   fit: BoxFit.cover,
                                        //   image: NetworkImage(imageUrl +
                                        //       apiPackages![index].packageImage),
                                        // )),
                                      )),
                                ),
                              ),
                              Positioned(
                                  top: 220,
                                  left: 70,
                                  child: Container(
                                    height: 105,
                                    width: 250,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            apiPackages != null
                                                ? Text(
                                                    apiPackages![index]
                                                        .packageName,
                                                    style: const TextStyle(
                                                        color: Color.fromARGB(
                                                            255, 64, 64, 64),
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )
                                                : CircularProgressIndicator(),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            apiPackages != null
                                                ? Text(
                                                    "     Contact : ${apiPackages![index].packageContact}    ")
                                                : CircularProgressIndicator(),
                                            SizedBox(
                                              height: 8,
                                            ),
                                          ]),
                                    ),
                                  )),
                            ],
                          ),
                          //color: Colors.black,
                        ),
                      ),

                      ///====
                      ///
                      ///

                      ////===
                      ///
                    ],
                  ),
                ),
              ),
            );
          },
        )));
  }
}
