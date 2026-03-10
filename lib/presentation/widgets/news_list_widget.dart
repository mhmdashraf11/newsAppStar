import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_star/business_logic/cubit/news_cubit.dart';
import 'package:news_app_star/constants/my_colors.dart';
import 'package:news_app_star/constants/strings.dart';
import 'package:news_app_star/data/models/news_model.dart';
import 'package:news_app_star/presentation/functions/published_from.dart';

class NewsListWidget extends StatelessWidget {
  final List<Article> articles;

  const NewsListWidget({super.key, required this.articles});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: MyColors.primaryColor,
      onRefresh: () async {
        await context.read<NewsCubit>().getTopHeadlines();
      },
      child: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: articles.length,
        itemBuilder: (context, index) {
          final article = articles[index];

          return InkWell(
            onTap: () {
              Navigator.pushNamed(context, details, arguments: article);
            },
            child: Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 3,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (article.urlToImage != null)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        article.urlToImage!,
                        height: 180,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(12),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          article.title,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          article.description ?? "",
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),

                        const SizedBox(height: 15),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              PublishedFromNow(article.publishedAt),
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                backgroundColor: MyColors.primaryColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                              ),
                              child: const Text(
                                "Read More",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
