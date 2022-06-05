// To parse this JSON data, do
//
//     final apiPackages = apiPackagesFromJson(jsonString);

import 'dart:convert';

List<ApiPackages> apiPackagesFromJson(String str) => List<ApiPackages>.from(
    json.decode(str).map((x) => ApiPackages.fromJson(x)));

String apiPackagesToJson(List<ApiPackages> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiPackages {
  ApiPackages({
    required this.id,
    required this.packageName,
    required this.packagePrice,
    required this.packageProvider,
    required this.packageContact,
    required this.packageDate,
    required this.packageTime,
    required this.packageDescription,
    required this.packageImage,
  });

  int id;
  String packageName;
  int packagePrice;
  String packageProvider;
  int packageContact;
  String packageDate;
  String packageTime;
  String packageDescription;
  String packageImage;

  factory ApiPackages.fromJson(Map<String, dynamic> json) => ApiPackages(
        id: json["id"],
        packageName: json["package_name"],
        packagePrice: json["package_price"],
        packageProvider: json["package_provider"],
        packageContact: json["package_contact"],
        packageDate: json["package_date"],
        packageTime: json["package_time"],
        packageDescription: json["package_description"],
        packageImage: json["package_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "package_name": packageName,
        "package_price": packagePrice,
        "package_provider": packageProvider,
        "package_contact": packageContact,
        "package_date": packageDate,
        "package_time": packageTime,
        "package_description": packageDescription,
        "package_image": packageImage,
      };
}
