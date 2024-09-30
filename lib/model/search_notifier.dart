import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kalpas_news_app/model/search_model.dart';
import 'package:kalpas_news_app/repo/search_repo.dart';

// Provider to manage the search query and results
final newsSearchProvider =
    StateNotifierProvider<NewsSearchNotifier, AsyncValue<List<SearchModel>>>(
        (ref) => NewsSearchNotifier(NewsRepository()));

class NewsSearchNotifier extends StateNotifier<AsyncValue<List<SearchModel>>> {
  final NewsRepository _repository;

  NewsSearchNotifier(this._repository) : super(const AsyncValue.loading());

  Future<void> searchNews(String query) async {
    state = const AsyncValue.loading();
    try {
      final articles = await _repository.searchNews(query);
      state = AsyncValue.data(articles);
    } catch (error) {
print("erroe{$error}")  ;  }
  }
}