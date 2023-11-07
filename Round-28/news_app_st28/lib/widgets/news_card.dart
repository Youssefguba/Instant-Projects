import 'package:flutter/material.dart';
import 'package:news_app_st28/model/news_model.dart';

import '../screens/new_details_screen.dart';

class NewsCardWidget extends StatelessWidget {
  final Article article;
  const NewsCardWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => NewsDetailsScreen(article)));
        },
        leading: Image.network(
          article.urlToImage ?? 'https://upload.wikimedia.org/wikipedia/commons/b/b7/TechCrunch_favicon_gradient.png',
          height: 30,
          width: 30,
        ),
        title: Text(
          article.title ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        subtitle: Text(
          article.description ?? '',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const Icon(Icons.arrow_circle_right_rounded),
      ),
    );
  }
}
