import 'package:chip_filter/controller/pagination_controller.dart';
import 'package:chip_filter/controller/selected_categorty_controleer.dart';
import 'package:chip_filter/models/product.dart';
import 'package:chip_filter/view/animation_text_page.dart';
import 'package:chip_filter/view/filter_chip_page.dart';
import 'package:chip_filter/view/pagination_page.dart';
import 'package:chip_filter/view/search_list_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox<Product>('products');
  await Hive.openBox<bool>('checkboxStates');

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => SelectedCategoriesController()),
        ChangeNotifierProvider(create: (context) => PaginationController()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        FilterChipPage.ROUTNAME: (context) => const FilterChipPage(),
        PaginationPage.ROUTNAME: (context) => const PaginationPage(),
        SearchListPage.ROUTNAME: (context) => const SearchListPage(),
      },
      debugShowCheckedModeBanner: false,
      title: 'Filter data',
      theme: ThemeData(
        textTheme: TextTheme(
            labelLarge: TextStyle(
                color: Colors.blueGrey.shade700,
                fontWeight: FontWeight.w600,
                fontSize: 25),
            titleMedium: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 25)),
        primaryColor: Colors.blueGrey,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  const FilterChipPage(),
    );
  }
}
