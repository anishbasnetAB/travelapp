// To parse this JSON data, do
//
//     final apiAccomodation = apiAccomodationFromJson(jsonString);

import 'dart:convert';

List<ApiAccomodation> apiAccomodationFromJson(String str) =>
    List<ApiAccomodation>.from(
        json.decode(str).map((x) => ApiAccomodation.fromJson(x)));

String apiAccomodationToJson(List<ApiAccomodation> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiAccomodation {
  ApiAccomodation({
    required this.id,
    required this.accomodationName,
    required this.accomodationPrice,
    required this.accomodationContact,
    required this.accomodationLocation,
    required this.accomodationDescription,
    required this.accomodationImage,
    required this.destinationId,
  });

  int id;
  String accomodationName;
  int accomodationPrice;
  int accomodationContact;
  String accomodationLocation;
  String accomodationDescription;
  String accomodationImage;
  int destinationId;

  factory ApiAccomodation.fromJson(Map<String, dynamic> json) =>
      ApiAccomodation(
        id: json["id"],
        accomodationName: json["accomodation_name"],
        accomodationPrice: json["accomodation_price"],
        accomodationContact: json["accomodation_contact"],
        accomodationLocation: json["accomodation_location"],
        accomodationDescription: json["accomodation_description"],
        accomodationImage: json["accomodation_image"],
        destinationId: json["destination_id"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accomodation_name": accomodationName,
        "accomodation_price": accomodationPrice,
        "accomodation_contact": accomodationContact,
        "accomodation_location": accomodationLocation,
        "accomodation_description": accomodationDescription,
        "accomodation_image": accomodationImage,
        "destination_id": destinationId,
      };
}
