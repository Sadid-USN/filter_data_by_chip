import 'package:chip_filter/models/product.dart';
import 'package:flutter/material.dart';

class SelectedCategoriesController extends ChangeNotifier {
  final List<String> selectedCategories = [];
 final List<String> categories = productList.map((product) => product.category).toSet().toList();


  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    notifyListeners();
  }
}
