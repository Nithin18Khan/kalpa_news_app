





import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_news_app/model/widget/carousal_widget.dart';
import 'package:kalpas_news_app/model/widget/news_list.dart';
import 'package:kalpas_news_app/repo/news_provider.dart';

class NewsScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final newsAsyncValue = ref.watch(newsProvider);
    final allProviderValue = ref.watch(allNewsProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Kalpa Top Headlines'),
        leading: IconButton(
          icon: Icon(Icons.menu_sharp),
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: newsAsyncValue.when(
        data: (articles) {
          final topImages = articles
              .take(6) // Get the first 6 articles
              .map((article) => {
                    'imageUrl': article.imageUrl, // Fixing imageUrl field
                    'author': article.author , // Providing fallback
                  })
              .toList();

          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 10.0),
                  child: NewsCarousel(imageDetails: topImages),
                ),
              ),
              // Add Latest News title here
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Text(
                    'Latest News',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                       color: Colors.blue,
                    ),
                  ),
                ),
              ),
              allProviderValue.when(
                data: (allArticles) => SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final news = allArticles[index]; // Access individual articles
                      return NewsCard(
                        title: news.title,
                        description: news.description,
                        date: news.publishedAt,
                        imageUrl: news.urlToImage ?? 'https://via.placeholder.com/150',
                        articles: news,
                      );
                    },
                    childCount: allArticles.length,
                  ),
                ),
                loading: () => SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                ),
                error: (err, _) => SliverToBoxAdapter(
                  child: Center(child: Text('Error loading articles: $err')),
                ),
              ),
            ],
          );
        },
        loading: () => Center(child: CircularProgressIndicator()),
        error: (err, _) => Center(child: Text('Error: $err')),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: [
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home),
      //       label: 'Home',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.search),
      //       label: 'Search',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.grid_view),
      //       label: 'Categories',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person),
      //       label: 'Profile',
      //     ),
      //   ],
      //   currentIndex: 0,
      //   onTap: (index) {
      //     print('Selected index: $index');
      //   },
      //   backgroundColor: Colors.blue,
      //   selectedItemColor: Colors.black,
      //   unselectedItemColor: Colors.black,
      //   elevation: 8.0,
      // ),
    );
  }
}
