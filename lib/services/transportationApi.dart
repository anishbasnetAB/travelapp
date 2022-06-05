import 'package:a/models/api_accomodation.dart';
import 'package:a/models/api_transportaion.dart';
import 'package:a/models/api_trekGuides.dart';
import 'package:http/http.dart' as http;

class TransporationServices {
  Future<List<ApiTransportation>?> getTransportation() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:8000/transportation/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return apiTransportationFromJson(json);
    }
  }
}
