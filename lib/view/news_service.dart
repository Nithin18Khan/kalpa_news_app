




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


































// class NewsService {
//   final String _apiKey = '0da9ac9d31834dd39e49d43bd170c4e5';
//   final String _baseUrl = 'https://newsapi.org/v2/top-headlines?country=us';

//   /// Fetch JWT from SharedPreferences
//   Future<String?> getStoredJWT() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     return prefs.getString('jwt_token');
//   }

//   /// Store JWT in SharedPreferences
//   Future<void> storeJWT(String token) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.setString('jwt_token', token);
//   }

//   Future<List<NewsArticle>> fetchNewsArticles() async {
//     final url = '$_baseUrl&apiKey=$_apiKey';
//     final response = await http.get(Uri.parse(url));

//     if (response.statusCode == 200) {
//       // Assume JWT is part of the response header for example
//       final jwtToken = response.headers['Authorization']; // or where your JWT is
//       if (jwtToken != null) {
//         await storeJWT(jwtToken); // Store JWT in SharedPreferences
//       }

//       final data = json.decode(response.body);
//       List articles = data['articles'];
//       return articles.map((article) => NewsArticle.fromJson(article)).toList();
//     } else {
//       throw Exception('Failed to load news');
//     }
//   }

//   Future<List<Article>> fetchAllNews() async {
//     final String allNewsUrl =
//         'https://newsapi.org/v2/everything?q=apple&from=2024-09-17&to=2024-09-17&sortBy=popularity&apiKey=$_apiKey';

//     final response = await http.get(Uri.parse(allNewsUrl));

//     if (response.statusCode == 200) {
//       final data = json.decode(response.body);
//       List newNews = data['articles'];
//       return newNews.map((article) => Article.fromJson(article)).toList();
//     } else {
//       throw Exception('Failed to load all news');
//     }
//   }

//   /// Fetch data with JWT in request
//   Future<void> fetchDataWithJWT() async {
//     final storedJWT = await getStoredJWT();
//     if (storedJWT != null) {
//       final url = 'https://example.com/protected-endpoint';
//       final response = await http.get(
//         Uri.parse(url),
//         headers: {
//           'Authorization': 'Bearer $storedJWT', // Send JWT in header
//         },
//       );

//       if (response.statusCode == 200) {
//         // Handle successful request
//       } else {
//         throw Exception('Failed to load protected resource');
//       }
//     } else {
//       print('No JWT found');
//     }
//   }
// }
