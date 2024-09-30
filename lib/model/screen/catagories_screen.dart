import 'package:flutter/material.dart';
import 'package:kalpas_news_app/model/news_source_model.dart';
import 'package:kalpas_news_app/view/categories_service.dart';
// Import the model

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  final CategoriesService apiService = CategoriesService();
  Map<String, List<NewsSource>> categorySources = {
    'business': [],
    'entertainment': [],
    'general': [],
    'health': [],
    'science': [],
    'sports': [],
    'technology': [],
  };

  @override
  void initState() {
    super.initState();
    fetchCategoryNewsSources();
  }

  Future<void> fetchCategoryNewsSources() async {
    for (var category in categorySources.keys) {
      List<NewsSource> sources = await apiService.fetchNewsSources(category);
      setState(() {
        categorySources[category] = sources;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Top News Sources'),
      ),
      body: ListView(
        children: categorySources.entries.map((entry) {
          final category = entry.key;
          final sources = entry.value;
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    category.toUpperCase(),
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  height: 200, // Adjust height based on design
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: sources.length,
                    itemBuilder: (context, index) {
                      final source = sources[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigate to web page or source details
                          },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Container(
                              width: 150, // Adjust width as needed
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        source.name,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        source.description,
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: Colors.grey,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
       
        }).toList(),
      ),
    );
  }
}
