import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_star/business_logic/cubit/news_cubit.dart';
import 'package:news_app_star/constants/strings.dart';
import 'package:news_app_star/data/models/news_model.dart';
import 'package:news_app_star/presentation/functions/published_from.dart';

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsCubit, NewsState>(
      builder: (context, state) {
        final savedArticles = state is NewsSuccess
            ? state.savedArticles
            : <Article>[];

        return Scaffold(
          appBar: AppBar(title: const Text("Saved Articles")),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: savedArticles.isEmpty
                ? const Center(
                    child: Text(
                      "No saved articles yet. Save one from Home.",
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                : ListView.separated(
                    itemCount: savedArticles.length,
                    separatorBuilder: (context, index) => const Divider(),
                    itemBuilder: (context, index) {
                      final article = savedArticles[index];
                      return ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        title: Text(article.title),
                        subtitle: Text(
                          article.publishedAt != null
                              ? PublishedFromNow(article.publishedAt!)
                              : "",
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete_outline),
                          onPressed: () {
                            context.read<NewsCubit>().removeSavedArticle(
                              article,
                            );
                          },
                        ),
                        onTap: () {
                          // Optionally show details
                          Navigator.pushNamed(
                            context,
                            details,
                            arguments: article,
                          );
                        },
                      );
                    },
                  ),
          ),
        );
      },
    );
  }
}
