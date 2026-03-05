import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:news_app_star/data/models/news_model.dart';
import 'package:news_app_star/data/repository/news_repository.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  final NewsRepository newsRepository;
  NewsCubit(this.newsRepository) : super(NewsInitial());
  List<Article> articles = [];
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
}
