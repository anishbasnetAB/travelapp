// To parse this JSON data, do
//
//     final apiTransportation = apiTransportationFromJson(jsonString);

import 'dart:convert';

List<ApiTransportation> apiTransportationFromJson(String str) =>
    List<ApiTransportation>.from(
        json.decode(str).map((x) => ApiTransportation.fromJson(x)));

String apiTransportationToJson(List<ApiTransportation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiTransportation {
  ApiTransportation({
    required this.id,
    required this.transportationName,
    required this.transportationPrice,
    required this.transportationContact,
    required this.transportationLocation,
    required this.transportationDescription,
    required this.transportationImage,
    required this.destinationId,
  });

  int id;
  String transportationName;
  int transportationPrice;
  int transportationContact;
  String transportationLocation;
  String transportationDescription;
  String transportationImage;
  int destinationId;

  factory ApiTransportation.fromJson(Map<String, dynamic> json) =>
      ApiTransportation(
        id: json["id"],
        transportationName: json["transportation_name"],
        transportationPrice: json["transportation_price"],
        transportationContact: json["transportation_contact"],
        transportationLocation: json["transportation_location"],
        transportationDescription: json["transportation_description"],
        transportationImage: json["transportation_image"],
        destinationId: json["destination_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "transportation_name": transportationName,
        "transportation_price": transportationPrice,
        "transportation_contact": transportationContact,
        "transportation_location": transportationLocation,
        "transportation_description": transportationDescription,
        "transportation_image": transportationImage,
        "destination_id": destinationId,
      };
}
