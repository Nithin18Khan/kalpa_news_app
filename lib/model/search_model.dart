class SearchModel {
  final String title;
  final String url;
  final String imageUrl;
  final String author;
  final String publishedAt;

  SearchModel({required this.title, required this.url,required this.imageUrl,
    required this.author,
    required this.publishedAt});

  factory SearchModel.fromJson(Map<String, dynamic> json) {
    return SearchModel(
      title: json['title'],
      url: json['url'],
      imageUrl: json['urlToImage'] ?? '',
      author: json['author'] ?? '',
      publishedAt: json['publishedAt'] ?? '',


    );
  }
}