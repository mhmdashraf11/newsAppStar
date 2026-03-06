import 'package:flutter/material.dart';
import 'package:news_app_star/constants/my_colors.dart';

class NewsLoadingWidget extends StatelessWidget {
  const NewsLoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(color: MyColors.primaryColor),
    );
  }
}
