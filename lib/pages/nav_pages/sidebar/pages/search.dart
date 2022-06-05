import 'package:a/location/home_screen.dart';
import 'package:a/models/api_destination.dart';
import 'package:a/pages/nav_pages/sidebar/pages/searchmodel.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<ApiDestination>? apiDestinations = [];

  static List<SearchModel> main_search_list = [
    SearchModel(
        destinationTitle: "ABC Trek", destinationImage: "assets/images/1.jpg"),
    SearchModel(
        destinationTitle: "Kori Trek", destinationImage: "assets/images/2.jpg"),
    SearchModel(
        destinationTitle: "Tilicho Trek",
        destinationImage: "assets/images/3.jpg"),
    SearchModel(
        destinationTitle: "Jas Trek", destinationImage: "assets/images/1.jpg"),
    SearchModel(
        destinationTitle: "REE Trek", destinationImage: "assets/images/2.jpg"),
    SearchModel(
        destinationTitle: "Yre Trek", destinationImage: "assets/images/3.jpg"),
    SearchModel(
        destinationTitle: "ABC Trek", destinationImage: "assets/images/1.jpg"),
    SearchModel(
        destinationTitle: "Tew Trek", destinationImage: "assets/images/2.jpg"),
    SearchModel(
        destinationTitle: "aw", destinationImage: "assets/images/1.jpg"),
    SearchModel(
        destinationTitle: "asww", destinationImage: "assets/images/2.jpg"),
  ];

  List<SearchModel> display_list = List.from(main_search_list);

  void updateList(String value) {
    setState(() {
      display_list = main_search_list
          .where((element) => element.destinationTitle!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("search for destination"),
            SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: (value) => updateList(value),
              decoration: InputDecoration(
                  hintText: "eg: ABC Trek", prefixIcon: Icon(Icons.search)),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: ListView.builder(
              itemCount: display_list.length,
              itemBuilder: (context, index) => ListTile(
                contentPadding: EdgeInsets.all(8),
                title: Text(display_list[index].destinationTitle!),
                leading: Image.asset(display_list[index].destinationImage!),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
