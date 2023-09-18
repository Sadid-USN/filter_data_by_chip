import 'package:chip_filter/controller/selected_categorty_controleer.dart';
import 'package:chip_filter/models/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FilterChipPage extends StatelessWidget {
  static const String ROUTNAME = "/filterChipPage";
  const FilterChipPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SelectedCategoriesController>(context);

    final filterProductList = productList.where((product) {
      return controller.selectedCategories.isEmpty ||
          controller.selectedCategories.contains(product.category);
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
              children: controller.categories
                  .map(
                    (product) => FilterChip(
                      selected: controller.selectedCategories.contains(product),
                      label: Text(
                        product,
                        style: const TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      ),
                      onSelected: (vaSelected) {
                        controller.toggleCategory(product);
                      },
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              itemCount: filterProductList.length,
              itemBuilder: (context, index) {
                final products = filterProductList[index];

                return Card(
                  elevation: 8.0,
                  margin: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
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

// class HomePage extends StatelessWidget {
//   static const String ROUTNAME = "/home";
//   const HomePage({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final controller = Provider.of<SelectedCategoriesController>(context);

//     final filterProductList = productList.where((product) {
//       return controller.selectedCategories.isEmpty ||
//           controller.selectedCategories.contains(product.category);
//     }).toList();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.blueGrey,
//         title: const Text('Filter Record using Popup Menu'),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding: const EdgeInsets.all(8),
//             margin: const EdgeInsets.all(8),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: controller.checkboxStatesBox.keys.map((category) {
//                 return Column(
//                   children: [
//                     Row(
//                       children: [
//                         Checkbox(
//                           checkColor: Colors.white,
//                           value: controller.isSelected(category),
//                           onChanged: (newValue) {
//                             controller.toggleCategory(category);
//                           },
//                         ),
//                         Text(category),
//                       ],
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//           ),
//           Expanded(
//             child: filterProductList.isEmpty
//                 ? const Center(
//                     child: Text('No matching data for selected categories.'),
//                   )
//                 : ListView.builder(
//                     padding: const EdgeInsets.symmetric(horizontal: 12),
//                     itemCount: filterProductList.length,
//                     itemBuilder: (context, index) {
//                       final product = filterProductList[index];

//                       return Card(
//                         elevation: 8.0,
//                         margin: const EdgeInsets.all(8.0),
//                         child: Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(8),
//                             color: Colors.indigo,
//                           ),
//                           child: ListTile(
//                             contentPadding: const EdgeInsets.symmetric(
//                                 vertical: 10, horizontal: 16),
//                             title: Text(
//                               product.name,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             subtitle: Text(
//                               product.category,
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontStyle: FontStyle.italic,
//                               ),
//                             ),
//                           ),
//                         ),
//                       );
//                     },
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }






