import 'package:dio/dio.dart';
import 'package:news_app_star/constants/strings.dart';
import 'package:news_app_star/data/models/news_model.dart';

class NewsService {
  static final NewsService _instance = NewsService._internal();
  factory NewsService() => _instance;
  NewsService._internal();
  // final newsApi = "$apiLink$apiTopHeadlines?country=us&apiKey=$apiKey";
  final newsDio = Dio(
    BaseOptions(connectTimeout: const Duration(seconds: 4), baseUrl: apiLink),
  );
  final cancelToken = CancelToken();
  void cancel() {
    cancelToken.cancel();
  }

  Future<NewsModel> getTopHeadlines() async {
    try {
      final response = await newsDio.get(
        apiTopHeadlines,
        cancelToken: cancelToken,
        queryParameters: {"country": "us", "apiKey": apiKey},
      );

      return NewsModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception(
        e.response?.data["message"] ?? e.message ?? "Network error",
      );
    }
  }
}
