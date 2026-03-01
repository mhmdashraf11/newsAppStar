part of 'news_cubit.dart';

@immutable
sealed class NewsState {}

final class NewsInitial extends NewsState {}

final class NewsLoading extends NewsState {}

class NewsSuccess extends NewsState {
  final List<Article> articles; 
  final String selectedCategory;

  NewsSuccess({
    required this.articles,
    required this.selectedCategory,
  });

  @override
  List<Object?> get props => [articles, selectedCategory];
}

class NewsError extends NewsState {
  final String message;

  NewsError(this.message);

  @override
  List<Object?> get props => [message];
}