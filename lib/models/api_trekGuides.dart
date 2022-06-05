import 'dart:convert';

List<ApiGuides> apiGuidesFromJson(String str) =>
    List<ApiGuides>.from(json.decode(str).map((x) => ApiGuides.fromJson(x)));

String apiGuidesToJson(List<ApiGuides> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ApiGuides {
  ApiGuides({
    required this.id,
    required this.guideFullName,
    required this.guideContact,
    required this.guideExperience,
    required this.guidePerDayPrice,
    required this.guideDescription,
    required this.guideImage,
  });

  int id;
  String guideFullName;
  int guideContact;
  int guideExperience;
  int guidePerDayPrice;
  String guideDescription;
  String guideImage;

  factory ApiGuides.fromJson(Map<String, dynamic> json) => ApiGuides(
        id: json["id"],
        guideFullName: json["guide_fullName"],
        guideContact: json["guide_contact"],
        guideExperience: json["guide_experience"],
        guidePerDayPrice: json["guide_perDay_price"],
        guideDescription: json["guide_description"],
        guideImage: json["guide_image"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "guide_fullName": guideFullName,
        "guide_contact": guideContact,
        "guide_experience": guideExperience,
        "guide_perDay_price": guidePerDayPrice,
        "guide_description": guideDescription,
        "guide_image": guideImage,
      };
}
