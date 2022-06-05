import 'package:a/models/api_trekGuides.dart';
import 'package:a/services/guideApi.dart';
import 'package:a/services/packageApi.dart';
import 'package:a/widgets/app_text.dart';
import 'package:flutter/material.dart';

class GuidePage extends StatefulWidget {
  const GuidePage({Key? key}) : super(key: key);

  @override
  State<GuidePage> createState() => _GuidePageState();
}

class _GuidePageState extends State<GuidePage> {
  List<ApiGuides>? apiGuides;

  var isLoaded = false;

  var imageUrl = "http://10.0.2.2:8000";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    apiGuides = await GuidesSerives().getGuides();
    if (apiGuides != null) {
      setState(() {
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "Trek Guides        ",
            style: TextStyle(color: Colors.black),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Container(
              height: 700,
              child: ListView.builder(
                  shrinkWrap: true,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemCount: apiGuides?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Card(
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
                                    offset: Offset(
                                        -18, 10), // changes position of shadow
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
                                    image: apiGuides != null
                                        ? DecorationImage(
                                            image: NetworkImage(imageUrl +
                                                (apiGuides != null &&
                                                        apiGuides!.isNotEmpty
                                                    ? apiGuides![index]
                                                        .guideImage
                                                    : '')),
                                            fit: BoxFit.cover)
                                        : DecorationImage(
                                            image: AssetImage(
                                                "assets/images/loading.png"),
                                          ),
                                  )),
                            ),
                          ),
                          Positioned(
                              left: 145,
                              child: Container(
                                height: 155,
                                width: 250,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          apiGuides != null
                                              ? AppText(
                                                  color: Colors.black,
                                                  text: apiGuides![index]
                                                      .guideFullName,
                                                  size: 19,
                                                )
                                              : CircularProgressIndicator(),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          apiGuides != null
                                              ? Text(
                                                  "Experience : ${apiGuides![index].guideExperience}")
                                              : CircularProgressIndicator(),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          apiGuides != null
                                              ? Text(
                                                  "Contact: ${apiGuides![index].guideContact}")
                                              : CircularProgressIndicator(),
                                          SizedBox(
                                            height: 3,
                                          ),
                                          apiGuides != null
                                              ? Text(
                                                  "Description : ${apiGuides![index].guideDescription}")
                                              : CircularProgressIndicator(),
                                        ]),
                                  ),
                                ),
                              )),
                        ],
                      ),
                    );
                  })
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
