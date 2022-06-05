import 'package:a/models/api_trekGuides.dart';
import 'package:http/http.dart' as http;

class GuidesSerives {
  Future<List<ApiGuides>?> getGuides() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:8000/trekguides/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return apiGuidesFromJson(json);
    }
  }
}
