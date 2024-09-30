class NewsSource {
  final String id;
  final String name;
  final String description;
  final String url;
  final String category;

  NewsSource({
    required this.id,
    required this.name,
    required this.description,
    required this.url,
    required this.category,
  });

  factory NewsSource.fromJson(Map<String, dynamic> json) {
    return NewsSource(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      url: json['url'],
      category: json['category'],
    );
  }
}
