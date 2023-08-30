import 'package:chip_filter/controller/selected_categorty_controleer.dart';
import 'package:chip_filter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final selectedCategoriesNotifier =
        Provider.of<SelectedCategoriesController>(context);

    final filterProductList = productList.where((product) {
      return selectedCategoriesNotifier.selectedCategories.isEmpty ||
          selectedCategoriesNotifier.selectedCategories
              .contains(product.category);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Filter Record using Chip'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            margin: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: selectedCategoriesNotifier.catigories
                  .map(
                    (product) => FilterChip(
                      selected: selectedCategoriesNotifier.selectedCategories
                          .contains(product),
                      label: Text(product),
                      onSelected: (vaSelected) {
                        selectedCategoriesNotifier.toggleCategory(product);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: filterProductList.isEmpty
                ? Center(
                    child: Text(
                        selectedCategoriesNotifier.selectedCategories.isEmpty
                            ? 'No data available.'
                            : 'No matching data for selected categories.'),
                  )
                : ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                    itemCount: filterProductList.length,
                    itemBuilder: (context, index) {
                      final products = filterProductList[index];

                      return Card(
                        elevation: 8.0,
                        margin: const EdgeInsets.all(8.0),
                        child: Container(
                       
                          decoration:  BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.indigo,
                          ),
                          child: ListTile(
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 16),
                            title: Text(
                              products.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              products.category,
                              style: const TextStyle(
                                color: Colors.white,
                                fontStyle: FontStyle.italic,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
