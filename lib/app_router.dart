import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_star/business_logic/cubit/news_cubit.dart';
import 'package:news_app_star/data/repository/news_repository.dart';
import 'package:news_app_star/data/web_services/news_service.dart';
import 'package:news_app_star/presentation/home_screen.dart';

class AppRouter {
  late NewsRepository newsRepository;
  late NewsCubit newsCubit;
  AppRouter() {
    newsRepository = NewsRepository(NewsService());
    newsCubit = NewsCubit(newsRepository);
  }
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => newsCubit,
            child: HomeScreen(),
          ),
        );
    }
  }
}
