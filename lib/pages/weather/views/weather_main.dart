import 'package:a/pages/weather/models/weather_models.dart';
import 'package:a/pages/weather/services/weather_api_client.dart';
import 'package:a/pages/weather/views/additional_information.dart';
import 'package:a/pages/weather/views/current_weather.dart';
import 'package:flutter/material.dart';

class WeatherScreen extends StatefulWidget {
  WeatherScreen(this.latitude, this.longitude, {Key? key}) : super(key: key);
  var latitude;
  var longitude;

  @override
  State<WeatherScreen> createState() =>
      _WeatherScreenState(this.latitude, this.longitude);
}

class _WeatherScreenState extends State<WeatherScreen> {
  var latiude;
  var longitude;
  _WeatherScreenState(this.latiude, this.longitude);
  WeatherApiClient client = WeatherApiClient();
  Weather? data;

  Future<void> getData() async {
    //28.530036604261245, 83.87928747813788
    data = await client.getCurrentWeather(latiude, longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: FutureBuilder(
          future: getData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return SingleChildScrollView(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100,
                      ),
                      Text(" Today",
                          style: TextStyle(
                              fontSize: 35, fontWeight: FontWeight.bold)),
                      SizedBox(
                        height: 15,
                      ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.center,
                      //   children: [
                      //     const Icon(
                      //       Icons.pin_drop,
                      //       size: 20,
                      //     ),
                      //     SizedBox(
                      //       width: 2,
                      //     ),
                      //     Text(
                      //       "${data!.name}",
                      //       style: const TextStyle(
                      //         color: Color.fromARGB(255, 65, 65, 65),
                      //         fontSize: 20,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      SizedBox(
                        height: 20,
                      ),
                      currentWeather(
                          Icons.wb_sunny_sharp, "${data!.temperature}"),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Detail Weather Information",
                        style: TextStyle(
                            fontSize: 24,
                            color: Color.fromARGB(255, 100, 100, 100),
                            fontWeight: FontWeight.bold),
                      ),
                      Divider(),
                      SizedBox(
                        height: 20,
                      ),
                      additionalInformation(
                        "${data!.wind}",
                        "${data!.feels_like}",
                        "${data!.humidity}",
                        "${data!.pressure}",
                        "${data!.minTemperature}",
                        "${data!.maxTemperature}",
                      ),
                      SizedBox(
                        height: 12,
                      ),
                    ],
                  ),
                ),
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              CircularProgressIndicator();
            }
            return Container();
          },
        ));
  }
}




// import 'package:flutter/material.dart';
// import 'package:frontendfyp/pages/weather/models/weather_models.dart';
// import 'package:frontendfyp/pages/weather/services/weather_api_client.dart';
// import 'package:frontendfyp/pages/weather/views/additional_information.dart';
// import 'package:frontendfyp/pages/weather/views/current_weather.dart';

// class WeatherScreen extends StatefulWidget {
//   const WeatherScreen({Key? key}) : super(key: key);

//   @override
//   State<WeatherScreen> createState() => _WeatherScreenState();
// }

// class _WeatherScreenState extends State<WeatherScreen> {
//   WeatherApiClient client = WeatherApiClient();
//   Weather? data;

//   Future<void> getData() async {
//     //28.530036604261245, 83.87928747813788
//     data = await client.getCurrentWeather(28.530036604261245,
//         83.87928747813788); //27.717492616715553, 85.30953959311097
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.white,
//         body: FutureBuilder(
//           future: getData(),
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.done) {
//               return SingleChildScrollView(
//                 child: Center(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 70,
//                       ),
//                       Text("Today",
//                           style: TextStyle(
//                               fontSize: 35, fontWeight: FontWeight.bold)),
//                       SizedBox(
//                         height: 15,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           const Icon(
//                             Icons.pin_drop,
//                             size: 20,
//                           ),
//                           SizedBox(
//                             width: 2,
//                           ),
//                           Text(
//                             "ABC View Point",
//                             style: const TextStyle(
//                               color: Color.fromARGB(255, 65, 65, 65),
//                               fontSize: 16,
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       currentWeather(
//                           Icons.sunny, "${data!.temperature}", "${data!.name}"),
//                       SizedBox(
//                         height: 0,
//                       ),
//                       Text(
//                         "Detail Weather Information",
//                         style: TextStyle(
//                             fontSize: 24,
//                             color: Colors.amber,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       Divider(),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       additionalInformation(
//                         "${data!.wind}",
//                         "${data!.feels_like}",
//                         "${data!.humidity}",
//                         "${data!.pressure}",
//                         "${data!.minTemperature}",
//                         "${data!.maxTemperature}",
//                       ),
//                       SizedBox(
//                         height: 12,
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             } else if (snapshot.connectionState == ConnectionState.waiting) {
//               child:
//               CircularProgressIndicator();
//             }
//             return Container();
//           },
//         ));
//   }
// }