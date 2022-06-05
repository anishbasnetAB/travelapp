import 'package:flutter/material.dart';

Widget currentWeather(IconData icon, String temp) {
  return Center(
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          color: Color.fromARGB(255, 255, 158, 12),
          size: 75,
        ),
        SizedBox(
          height: 12,
        ),
        Text(
          "$temp°",
          style: TextStyle(fontSize: 46),
        ),
      ],
    ),
  );
}
