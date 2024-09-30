

import 'package:kalpas_news_app/model/search_model.dart';

class NewsResponse {
  final List<SearchModel> articles;

  NewsResponse({required this.articles});

  factory NewsResponse.fromJson(Map<String, dynamic> json) {
    return NewsResponse(
      articles: (json['articles'] as List)
          .map((articleJson) => SearchModel.fromJson(articleJson))
          .toList(),
    );
  }
}
