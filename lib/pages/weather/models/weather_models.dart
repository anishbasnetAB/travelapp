import 'package:flutter/cupertino.dart';

class Weather {
  double? latitude;
  double? longitude;
  double? temperature;
  double? minTemperature;
  double? maxTemperature;
  double? wind;
  int? humidity;
  double? feels_like;
  int? pressure;
  String? name;

  Weather(
      {required this.latitude,
      this.longitude,
      this.temperature,
      this.minTemperature,
      this.maxTemperature,
      this.wind,
      this.humidity,
      this.feels_like,
      this.name,
      this.pressure});

  Weather.fromJson(Map<String, dynamic> json) {
    latitude = json["coord"]["lat"];
    longitude = json["coord"]["lon"];
    temperature = json["main"]["temp"];
    minTemperature = json["main"]["temp_min"];
    wind = json["wind"]["speed"];
    humidity = json["main"]["humidity"];
    feels_like = json["main"]["feels_like"];
    name = json["name"];
    pressure = json["main"]["pressure"];
    maxTemperature = json["main"]["temp_max"];
  }
}
