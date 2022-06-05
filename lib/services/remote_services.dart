import 'package:a/models/api_destination.dart';
import 'package:http/http.dart' as http;

class RemoteServices {
  Future<List<ApiDestination>?> getDestinations() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:8000/destination/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return apiDestinationFromJson(json);
    }
  }
}
