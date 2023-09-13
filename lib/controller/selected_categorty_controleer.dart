import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class SelectedCategoriesController extends ChangeNotifier {
  final Box<bool> checkboxStatesBox = Hive.box<bool>('checkboxStates');
  final List<String> selectedCategories = [];
  final Map<String, bool> categorySelectedState = {
    "Food": false,
    "Fruit": false,
    "Vehicle": false,
    "Clothes": false,
  };



 void toggleCategory(String category) {
  if (categorySelectedState.containsKey(category)) {

    categorySelectedState[category] = !isSelected(category);

    checkboxStatesBox.put(category, categorySelectedState[category]!);

    if (isSelected(category)) {
      selectedCategories.add(category);
    } else {
      selectedCategories.remove(category);
    }
    notifyListeners();
  }
}



  bool isSelected(String category) {
    return checkboxStatesBox.get(category, defaultValue: false)!;
  }
}
