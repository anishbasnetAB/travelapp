import 'dart:convert';
import 'package:a/pages/weather/models/weather_models.dart';
import 'package:http/http.dart' as http;

class WeatherApiClient {
  Future<Weather>? getCurrentWeather(
      double? longitude, double? latitude) async {
    var endpoint = Uri.parse(
        "https://api.openweathermap.org/data/2.5/weather?lat=$longitude&lon=$latitude&appid=cb62cbfc1938d2556f9ef2359f1225e8&units=metric");
    var respose = await http.get(endpoint);
    var body = jsonDecode(respose.body);
    print(Weather.fromJson(body).latitude);
    print(Weather.fromJson(body).longitude);
    print(Weather.fromJson(body).temperature);
    print(Weather.fromJson(body).feels_like);
    return Weather.fromJson(body);
  }
}
