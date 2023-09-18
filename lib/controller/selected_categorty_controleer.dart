import 'package:chip_filter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SelectedCategoriesController extends ChangeNotifier {
  final List<String> selectedCategories = [];
  final List<String> categories =
      productList.map((product) => product.category).toSet().toList();

  final String _boxName =
      'selectedCategories'; // Change this to your desired box name

  SelectedCategoriesController() {
    _loadSelectedCategories();
  }

  void _loadSelectedCategories() async {
    final box = await Hive.openBox<List<String>>(_boxName);
    if (box.containsKey(_boxName)) {
      selectedCategories.addAll(box.get(_boxName)!);

      notifyListeners();
    }
  }

  void toggleCategory(String category) async {
    if (selectedCategories.contains(category)) {
      selectedCategories.remove(category);
    } else {
      selectedCategories.add(category);
    }

    notifyListeners();

    final box = await Hive.openBox<List<String>>(_boxName);
    await box.put(_boxName, selectedCategories);
    print(box.values);
  }
}
