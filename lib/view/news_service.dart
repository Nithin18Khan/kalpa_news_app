import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:kalpas_news_app/model/news_model.dart';
import 'package:kalpas_news_app/model/source_model.dart';

class NewsService {
  final String _apiKey = '0da9ac9d31834dd39e49d43bd170c4e5';
  final String _baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';

  Future<List<NewsArticle>> fetchNewsArticles() async {
    final url = '$_baseUrl&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List articles = data['articles'];
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news');
    }
  }
Future<List<Article>> fetchAllNews() async {

 final String allNewsUrl = 'https://newsapi.org/v2/everything?q=apple&from=2024-09-17&to=2024-09-17&sortBy=popularity&apiKey=$_apiKey';
    final response = await http.get(Uri.parse(allNewsUrl));
  if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List newNews = data['articles'];
      return newNews.map((article) => Article.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load all news');
    }
  }

}
