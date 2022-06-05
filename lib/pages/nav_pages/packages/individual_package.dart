import 'package:a/models/api_packages.dart';
import 'package:a/widgets/app_text.dart';
import 'package:a/widgets/colors.dart';
import 'package:flutter/material.dart';

class IndividualPackage extends StatefulWidget {
  ApiPackages? individaulPage;

  IndividualPackage({required this.individaulPage});

  @override
  _IndividualPackageState createState() => _IndividualPackageState();
}

class _IndividualPackageState extends State<IndividualPackage> {
  var imageUrl = "http://10.0.2.2:8000";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.themeColorDark,
        iconTheme: IconThemeData(color: Color.fromARGB(255, 238, 238, 238)),
        title: Center(
          child: Text(
            widget.individaulPage?.packageName ?? 'nul',
            style: TextStyle(color: Color.fromARGB(255, 238, 238, 238)),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child:
              // padding: const EdgeInsets.all(15.0),
              Column(
            children: [
              SizedBox(
                height: 20,
              ),

              Container(
                height: 612,
                child: Stack(
                  children: [
                    Positioned(
                        child: Material(
                      child: Container(
                        height: 600,
                        width: 500,
                        // color: Colors.red,
                        decoration: BoxDecoration(
                          //color: Colors.white,
                          color: Color.fromARGB(255, 255, 255, 255),
                          borderRadius: BorderRadius.circular(0.0),
                          // boxShadow: [
                          //   BoxShadow(
                          //     color: Color.fromARGB(255, 114, 114, 114)
                          //         .withOpacity(0.3),
                          //     spreadRadius: 4,
                          //     blurRadius: 20.0,
                          //     offset: Offset(
                          //         -10, 10), // changes position of shadow
                          //   ),
                          // ],
                        ),
                      ),
                    )),
                    Card(
                      elevation: 10,
                      shadowColor: Colors.grey.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15)),
                      child: Container(
                        height: 280,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    "$imageUrl${widget.individaulPage?.packageImage}"))),
                      ),
                    ),
                    Positioned(
                        top: 300,
                        //left: ,
                        child: Container(
                          height: 600,
                          // width: double.infinity,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20.0),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  AppText(
                                    text: widget.individaulPage?.packageName ??
                                        'nul',
                                    size: 25,
                                    color: Colors.black,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Provider :${widget.individaulPage?.packageProvider ?? 'nul'}  ",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color: Color.fromARGB(255, 49, 48, 48)),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Row(children: [
                                    Row(
                                      children: [
                                        Icon(Icons.phone),
                                        Text(widget
                                                .individaulPage?.packageContact
                                                .toString() ??
                                            'nul'),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.calendar_today),
                                        Text(
                                          widget.individaulPage?.packageDate ??
                                              'nul',
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      width: 20,
                                    ),
                                    Row(
                                      children: [
                                        Icon(Icons.attach_money_sharp),
                                        Text(widget.individaulPage?.packagePrice
                                                .toString() ??
                                            'nul'),
                                      ],
                                    ),
                                  ]),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(children: [
                                    Icon(Icons.watch),
                                    Text(
                                      widget.individaulPage?.packageTime ??
                                          'nul',
                                    )
                                  ]),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Description",
                                    style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 8,
                                  ),
                                  Container(
                                    width: 600,
                                    child: Padding(
                                      padding:
                                          const EdgeInsets.only(right: 210),
                                      child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              widget.individaulPage
                                                      ?.packageDescription ??
                                                  'nul',
                                            ),
                                          ]),
                                    ),
                                  )
                                ]),
                          ),
                        )),
                  ],
                ),
                //color: Colors.black,
              ),

              ////
              ///

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
  }
}
