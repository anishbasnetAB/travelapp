class UserList {
  int? id;
  String? destinationType;
  String? destinationName;
  String? destinationDescription;
  String? destinationLocation;
  int? destinationAltitude;
  double? destinationLatitude;
  double? destinationLongitude;
  int? destinationDays;
  int? destinationDistance;
  int? destinationAvgPrice;
  String? destinationEquipment;
  int? destinationEmergencyContact;
  String? destinationEmergencyDetail;
  String? destinationSeason;
  String? destinationMedicalNeeds;
  String? destinationScams;
  String? destinationImage;

  UserList(
      {this.id,
      this.destinationType,
      this.destinationName,
      this.destinationDescription,
      this.destinationLocation,
      this.destinationAltitude,
      this.destinationLatitude,
      this.destinationLongitude,
      this.destinationDays,
      this.destinationDistance,
      this.destinationAvgPrice,
      this.destinationEquipment,
      this.destinationEmergencyContact,
      this.destinationEmergencyDetail,
      this.destinationSeason,
      this.destinationMedicalNeeds,
      this.destinationScams,
      this.destinationImage});

  UserList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    destinationType = json['destination_type'];
    destinationName = json['destination_name'];
    destinationDescription = json['destination_description'];
    destinationLocation = json['destination_location'];
    destinationAltitude = json['destination_altitude'];
    destinationLatitude = json['destination_latitude'];
    destinationLongitude = json['destination_longitude'];
    destinationDays = json['destination_days'];
    destinationDistance = json['destination_distance'];
    destinationAvgPrice = json['destination_avgPrice'];
    destinationEquipment = json['destination_equipment'];
    destinationEmergencyContact = json['destination_emergencyContact'];
    destinationEmergencyDetail = json['destination_emergencyDetail'];
    destinationSeason = json['destination_season'];
    destinationMedicalNeeds = json['destination_medicalNeeds'];
    destinationScams = json['destination_scams'];
    destinationImage = json['destination_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['destination_type'] = this.destinationType;
    data['destination_name'] = this.destinationName;
    data['destination_description'] = this.destinationDescription;
    data['destination_location'] = this.destinationLocation;
    data['destination_altitude'] = this.destinationAltitude;
    data['destination_latitude'] = this.destinationLatitude;
    data['destination_longitude'] = this.destinationLongitude;
    data['destination_days'] = this.destinationDays;
    data['destination_distance'] = this.destinationDistance;
    data['destination_avgPrice'] = this.destinationAvgPrice;
    data['destination_equipment'] = this.destinationEquipment;
    data['destination_emergencyContact'] = this.destinationEmergencyContact;
    data['destination_emergencyDetail'] = this.destinationEmergencyDetail;
    data['destination_season'] = this.destinationSeason;
    data['destination_medicalNeeds'] = this.destinationMedicalNeeds;
    data['destination_scams'] = this.destinationScams;
    data['destination_image'] = this.destinationImage;
    return data;
  }
}
