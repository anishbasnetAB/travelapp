import 'dart:convert';

import 'package:a/pages/nav_pages/sidebar/pages/search/user_list.dart';
import 'package:http/http.dart' as http;

class FetchUserList {
  var data = [];
  List<UserList> results = [];
  String urlList = 'http://10.0.2.2:8000/destination/';

  Future<List<UserList>> getuserList({String? query}) async {
    var url = Uri.parse(urlList);
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        data = json.decode(response.body);
        results = data.map((e) => UserList.fromJson(e)).toList();
        if (query != null) {
          results = results
              .where((element) => element.destinationName!
                  .toLowerCase()
                  .contains((query.toLowerCase())))
              .toList();
        }
      } else {
        print("fetch error");
      }
    } on Exception catch (e) {
      print('error: $e');
    }
    return results;
  }
}
