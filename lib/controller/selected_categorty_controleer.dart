import 'package:flutter/material.dart';

class SelectedCategoriesController extends ChangeNotifier {
  final List<String> selectedCategories = [];

  final List<String> catigories = [
    "Food",
    "Fruit",
    "Vehicle",
    "Clothes",
  ];
  
  void toggleCategory(String category) {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }
    notifyListeners();
  }
}
