
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_news_app/model/search_notifier.dart';
import 'package:kalpas_news_app/model/widget/search_card.dart';

class SearchScreen extends ConsumerStatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(newsSearchProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Search News'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                labelText: 'Search for news articles',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {
                    final query = _searchController.text.trim();
                    if (query.isNotEmpty) {
                      ref
                          .read(newsSearchProvider.notifier)
                          .searchNews(query);
                    }
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: searchState.when(
                data: (articles) => articles.isEmpty
                    ? Center(child: Text('No results found'))
                    : ListView.builder(
                        itemCount: articles.length,
                        itemBuilder: (context, index) {
                          final article = articles[index];
                          return SearchCard(title: article.title,
                           description: article.publishedAt, 
                           date: article.author, 
                           url: article.url,
                            searchModel: article, 
                            imageUrl: article.imageUrl,);
                          // return Card(
                          //   child: ListTile(
                          //     title: Text(article.title),
                          //     onTap: () async {
                          //       final url = article.url;
                          //       if (await canLaunch(url)) {
                          //         await launch(url);
                          //       } else {
                          //         throw 'Could not launch $url';
                          //       }
                          //     },
                          //   ),
                          // );
                        },
                      ),
                loading: () => Center(child: CircularProgressIndicator()),
                error: (error, _) =>
                    Center(child: Text('Error loading news: $error')),
              ),
            ),
          ],
        ),
      ),
    );
  }
}