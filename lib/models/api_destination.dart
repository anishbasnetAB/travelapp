// To parse this JSON data, do
//
//     final apiDestination = apiDestinationFromJson(jsonString);

import 'dart:convert';

List<ApiDestination> apiDestinationFromJson(String str) =>
    List<ApiDestination>.from(
        json.decode(str).map((x) => ApiDestination.fromJson(x)));

String apiDestinationToJson(List<ApiDestination> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiDestination {
  ApiDestination({
    required this.id,
    required this.accomodations,
    required this.transportations,
    required this.destinationType,
    required this.destinationName,
    required this.destinationDescription,
    required this.destinationLocation,
    required this.destinationAltitude,
    required this.destinationLatitude,
    required this.destinationLongitude,
    required this.destinationDays,
    required this.destinationDistance,
    required this.destinationAvgPrice,
    required this.destinationEquipment,
    required this.destinationEmergencyContact,
    required this.destinationEmergencyDetail,
    required this.destinationSeason,
    required this.destinationMedicalNeeds,
    required this.destinationScams,
    required this.destinationImage,
  });

  int id;
  List<Accomodation> accomodations;
  List<Transportation> transportations;
  String destinationType;
  String destinationName;
  String destinationDescription;
  String destinationLocation;
  int destinationAltitude;
  double destinationLatitude;
  double destinationLongitude;
  int destinationDays;
  int destinationDistance;
  int destinationAvgPrice;
  String destinationEquipment;
  int destinationEmergencyContact;
  String destinationEmergencyDetail;
  String destinationSeason;
  String destinationMedicalNeeds;
  String destinationScams;
  String destinationImage;

  factory ApiDestination.fromJson(Map<String, dynamic> json) => ApiDestination(
        id: json["id"],
        accomodations: List<Accomodation>.from(
            json["accomodations"].map((x) => Accomodation.fromJson(x))),
        transportations: List<Transportation>.from(
            json["transportations"].map((x) => Transportation.fromJson(x))),
        destinationType: json["destination_type"],
        destinationName: json["destination_name"],
        destinationDescription: json["destination_description"],
        destinationLocation: json["destination_location"],
        destinationAltitude: json["destination_altitude"],
        destinationLatitude: json["destination_latitude"].toDouble(),
        destinationLongitude: json["destination_longitude"].toDouble(),
        destinationDays: json["destination_days"],
        destinationDistance: json["destination_distance"],
        destinationAvgPrice: json["destination_avgPrice"],
        destinationEquipment: json["destination_equipment"],
        destinationEmergencyContact: json["destination_emergencyContact"],
        destinationEmergencyDetail: json["destination_emergencyDetail"],
        destinationSeason: json["destination_season"],
        destinationMedicalNeeds: json["destination_medicalNeeds"],
        destinationScams: json["destination_scams"],
        destinationImage: json["destination_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "accomodations":
            List<dynamic>.from(accomodations.map((x) => x.toJson())),
        "transportations":
            List<dynamic>.from(transportations.map((x) => x.toJson())),
        "destination_type": destinationType,
        "destination_name": destinationName,
        "destination_description": destinationDescription,
        "destination_location": destinationLocation,
        "destination_altitude": destinationAltitude,
        "destination_latitude": destinationLatitude,
        "destination_longitude": destinationLongitude,
        "destination_days": destinationDays,
        "destination_distance": destinationDistance,
        "destination_avgPrice": destinationAvgPrice,
        "destination_equipment": destinationEquipment,
        "destination_emergencyContact": destinationEmergencyContact,
        "destination_emergencyDetail": destinationEmergencyDetail,
        "destination_season": destinationSeason,
        "destination_medicalNeeds": destinationMedicalNeeds,
        "destination_scams": destinationScams,
        "destination_image": destinationImage,
      };
}

class Accomodation {
  Accomodation({
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

  factory Accomodation.fromJson(Map<String, dynamic> json) => Accomodation(
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

class Transportation {
  Transportation({
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

  factory Transportation.fromJson(Map<String, dynamic> json) => Transportation(
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
