import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalpas_news_app/model/search_model.dart';
import 'package:kalpas_news_app/view/search_service.dart';

class NewsRepository {
  final String apiKey = '0da9ac9d31834dd39e49d43bd170c4e5'; // Replace with your API key
  final String baseUrl = 'https://newsapi.org/v2/everything';

  Future<List<SearchModel>> searchNews(String query) async {
    final response = await http.get(Uri.parse(
        '$baseUrl?q=$query&apiKey=$apiKey'));

    if (response.statusCode == 200) {
      final jsonData = jsonDecode(response.body);
      final newsResponse = NewsResponse.fromJson(jsonData);
      return newsResponse.articles.toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
}
