import 'package:a/models/api_packages.dart';
import 'package:http/http.dart' as http;

class PackageServices {
  Future<List<ApiPackages>?> getPackage() async {
    var client = http.Client();
    var uri = Uri.parse('http://10.0.2.2:8000/packages/');

    var response = await client.get(uri);
    if (response.statusCode == 200) {
      var json = response.body;
      return apiPackagesFromJson(json);
    }
  }
}
