import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PaginationController extends ChangeNotifier {
  final scrollController = ScrollController();
  List<String> items = ["Items 1", "Items 2", "Items 3"];

  List<String> limitItems = List.generate(15, (index) => "Item ${index + 1}");

  initState() {
    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        refreshData();
      }
    });
  }

  Future<void> refreshData() async {
    // items.clear();
    // notifyListeners();
    String url = "https://jsonplaceholder.typicode.com/posts";

    final response = await http.get(Uri.parse(url)); // Use http package

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      items.addAll(newItems.map<String>((element) {
        final id = element["id"];
        
        return "Item from API $id";
      }).toList());

    
      notifyListeners();
    }
  }

}
