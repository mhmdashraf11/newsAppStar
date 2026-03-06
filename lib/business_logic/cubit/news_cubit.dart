import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_star/data/models/news_model.dart';
import 'package:news_app_star/data/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  NewsCubit(this.newsRepository) : super(NewsInitial());
  List<Article> articles = [];
  Timer? _debounce;
  String selectedCategory = "general";
  Future<void> getTopHeadlines() async {
    try {
      emit(NewsLoading());

      final news = await newsRepository.getTopHeadlines();
      print("News fetched successfully: ${news.articles.length} articles");

      emit(
        NewsSuccess(
          articles: news.articles,
          selectedCategory: selectedCategory,
        ),
      );
    } catch (error) {
      emit(NewsError(error.toString()));
    }
  }

  Future<void> searchNews(String query) async {
    try {
      emit(NewsLoading());

      final news = await newsRepository.searchNews(query);

      emit(
        NewsSuccess(
          articles: news.articles,
          selectedCategory: selectedCategory,
        ),
      );
    } catch (error) {
      emit(NewsError(error.toString()));
    }
  }

  void searchWithDebounce(String query) {
    if (_debounce?.isActive ?? false) {
      _debounce!.cancel();
    }

    _debounce = Timer(const Duration(milliseconds: 500), () {
      searchNews(query);
    });
  }
}
