import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class PaginationPage extends StatefulWidget {
    static const String ROUTNAME = "/pagination";
  const PaginationPage({Key? key}) : super(key: key);

  @override
  State<PaginationPage> createState() => _PaginationPageState();
}

class _PaginationPageState extends State<PaginationPage> {
  final scrollController = ScrollController();
  int page = 1;
  int limit = 25;
  List<String> limitItems = [];
  bool isLoading = false;
  bool hasMore = true; 

  @override
  void initState() {
    getData();

    scrollController.addListener(() {
      if (scrollController.position.maxScrollExtent ==
          scrollController.offset) {
        getData();
      }
    });

    super.initState();
  }

  Future<void> getData() async {
    if (isLoading || !hasMore) return;

    isLoading = true;
    String url =
        "https://jsonplaceholder.typicode.com/posts?_limit=$limit&_page=$page";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final List newItems = json.decode(response.body);

      setState(() {
        page++;
        isLoading = false;

        if (newItems.isEmpty) {
          hasMore = false; 
        }

        limitItems.addAll(newItems.map<String>((element) {
          final id = element["id"];
          return "Item$id";
        }).toList());
      });
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text(
          'Pagination',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        controller: scrollController,
        shrinkWrap: true,
        itemCount: limitItems.length + 1,
        itemBuilder: (context, index) {
          if (index < limitItems.length) {
            final item = limitItems[index];
            return Padding(
              padding: const EdgeInsets.only(left: 16, top: 20, bottom: 20),
              child: Text(
                item,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          } else if (!isLoading && !hasMore) {
            // Show the "No more data" message when there's no more data to load
            return Center(
              child: Text(
                "There is no more data",
                style: Theme.of(context).textTheme.labelLarge,
              ),
            );
          } else {
            // Show the loading indicator when loading more data
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
