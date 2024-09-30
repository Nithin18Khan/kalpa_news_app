import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalpas_news_app/model/news_source_model.dart';

class CategoriesService {
  final String apiKey = '0da9ac9d31834dd39e49d43bd170c4e5';
  final String apiUrl = 'https://newsapi.org/v2/top-headlines/sources';

  Future<List<NewsSource>> fetchNewsSources(String category) async {
    final response = await http.get(
      Uri.parse('$apiUrl?category=$category&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final sources = data['sources'] as List;
      return sources.map((json) => NewsSource.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load news sources');
    }
  }
}
