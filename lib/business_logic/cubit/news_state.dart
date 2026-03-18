part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<Article> articles;
  final String selectedCategory;
  final List<Article> savedArticles;

  NewsSuccess({
    required this.articles,
    required this.selectedCategory,
    required this.savedArticles,
  });

  NewsSuccess copyWith({
    List<Article>? articles,
    String? selectedCategory,
    List<Article>? savedArticles,
  }) {
    return NewsSuccess(
      articles: articles ?? this.articles,
      selectedCategory: selectedCategory ?? this.selectedCategory,
      savedArticles: savedArticles ?? this.savedArticles,
    );
  }

  @override
  List<Object?> get props => [articles, selectedCategory, savedArticles];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}
