import 'package:news_app_star/data/models/news_model.dart';
import 'package:news_app_star/data/web_services/news_service.dart';

class NewsRepository {
  final NewsService newsApiService;
  NewsRepository(this.newsApiService);
  Future<NewsModel> getTopHeadlines() async {
    final news = await newsApiService.getTopHeadlines();
    return news;
  }

  Future<NewsModel> searchNews(String query) {
    return NewsService().searchNews(query);
  }
}
