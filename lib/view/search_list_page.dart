
import 'package:flutter/material.dart';
import 'package:search_highlight_text/search_highlight_text.dart';

class SearchListPage extends StatefulWidget {
   static const String ROUTNAME = "/searchPage";
  const SearchListPage({super.key});

  @override
  State<SearchListPage> createState() => _SearchListPageState();
}

class _SearchListPageState extends State<SearchListPage> {
 
  List<Movie> _filterItems = [];

  final TextEditingController _searchController = TextEditingController();

  void _searchItems() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filterItems = movies.where((element) {
        return element.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filterItems = movies;
    }
    setState(() {});
  }
@override
  void dispose() {
   _searchController.dispose();
    super.dispose();
  }
  @override
  void initState() {
      _searchItems();
    _searchController.addListener(_searchItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Список элементов данных

    return 
    Scaffold(
      body: Column(
       
        children: [
          const SizedBox(height: 100,),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextField(
    
              controller: _searchController,
              decoration: InputDecoration(
                hintText: "Поиск",
                hintStyle:  TextStyle(fontSize: 16, color: Colors.grey.shade500),
                  fillColor: Colors.blueGrey.withOpacity(0.5),
                  border: const OutlineInputBorder()),
            ),
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              shrinkWrap: true,
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              itemExtent: 50.0,
              itemCount: _filterItems.length,
              itemBuilder: (context, index) {
                // Создаем элемент списка
                return ListTile(
                  trailing: Text(
                    "${index + 1}",
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  title: SearchHighlightText(
                    _filterItems[index].title,
                    searchText: _searchController.text,
                    // style: const TextStyle(
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.red, 
                    // ),
                  ),
                  subtitle: Text(
                    _filterItems[index].genre,
                    style: const TextStyle(
                      fontStyle: FontStyle.italic,
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

class Movie {
  String title;
  String description;
  String genre;
  Movie({
    required this.title,
    required this.description,
    required this.genre,
  });
}


 List<Movie> movies = [
    Movie(
      title: "Матрица",
      genre: "Фантастика, боевик",
      description: 'Фильм о мире, где реальность является иллюзией.',
    ),
    Movie(
      title: "Звездные войны",
      genre: "Фантастика, боевик",
      description: 'Эпическая сага о борьбе за галактику.',
    ),
    Movie(
      title: "Интерстеллар",
      genre: "Фантастика, драма",
      description:
          'Путешествие к звездам в поисках нового дома для человечества.',
    ),
    Movie(
      title: "Властелин колец: Братство кольца",
      genre: "Фэнтези, приключения",
      description:
          'Эпическое путешествие в Миддл-эрт для уничтожения Кольца Власти.',
    ),
    Movie(
      title: "Титаник",
      genre: "Драма, романтика",
      description: 'История любви и гибели на фоне крушения "Непотопляемого".',
    ),
    Movie(
      title: "Побег из Шоушенка",
      genre: "Драма, криминал",
      description: 'История дружбы и надежды в тюремном заключении.',
    ),
    Movie(
      title: "Форрест Гамп",
      genre: "Драма, комедия",
      description: 'Путешествие Форреста Гампа через жизнь и историю США.',
    ),
    Movie(
      title: "Зеленая миля",
      genre: "Драма, фэнтези",
      description: 'История охранника тюрьмы с необъяснимыми способностями.',
    ),
    Movie(
      title: "Пираты Карибского моря: Проклятие Черной жемчужины",
      genre: "Приключения, фэнтези",
      description:
          'Пиратские приключения капитана Джека Воробья и его команды.',
    ),
  ];
