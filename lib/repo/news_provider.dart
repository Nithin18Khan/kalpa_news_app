import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_news_app/model/news_model.dart';
import 'package:kalpas_news_app/model/source_model.dart';
import 'package:kalpas_news_app/view/news_service.dart';

final newsProvider = FutureProvider<List<NewsArticle>>((ref) async {
  final newsService = NewsService();
  final articles = await newsService.fetchNewsArticles();

  // Print the articles for debugging
  // for (var article in articles) {
  //   print('Title: ${article.title}');
  //   print('Description: ${article.description}');
  //   print('URL: ${article.url}');
  //   print('Image URL: ${article.imageUrl}');
  // }

  return articles;
});


final allNewsProvider = FutureProvider<List<Article>>((ref) async {

final allNews = NewsService();

final allViewNews = await allNews.fetchAllNews();
return allViewNews;
});