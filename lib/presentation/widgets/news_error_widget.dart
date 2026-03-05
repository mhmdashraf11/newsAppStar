import 'package:flutter/material.dart';

class NewsErrorWidget extends StatelessWidget {
  const NewsErrorWidget({super.key, required String message});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "An error occurred while fetching news. Please try again later.",
        style: TextStyle(color: Colors.red, fontSize: 16),
        textAlign: TextAlign.center,
      ),
    );
    }
}