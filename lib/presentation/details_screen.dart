import 'package:flutter/material.dart';
import 'package:news_app_star/constants/my_colors.dart';
import 'package:news_app_star/data/models/news_model.dart';
import 'package:news_app_star/presentation/functions/published_from.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.article});
  final Article article;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: MyColors.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: const Text(
            "Article Details",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.bookmark_border,
              color: MyColors.primaryColor,
            ),
            onPressed: () {
              // Implement save functionality here
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (article.urlToImage != null)
            Image.network(
              article.urlToImage!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  PublishedFromNow(article.publishedAt),
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                const SizedBox(height: 16),

                Text(
                  article.title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  article.description ?? "No description available.",
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 16),
                Text(
                  article.content ?? "No content available.",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
