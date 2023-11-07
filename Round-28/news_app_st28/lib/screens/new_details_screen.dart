import 'package:flutter/material.dart';
import 'package:news_app_st28/model/news_model.dart';

class NewsDetailsScreen extends StatelessWidget {
  final Article article;
  const NewsDetailsScreen(this.article);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          article.title ?? '',
          style: TextStyle(
            fontSize: 80,
          ),
        ),
      ),
    );
  }
}
