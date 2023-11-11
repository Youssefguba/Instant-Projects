import 'package:flutter/material.dart';
import 'package:new_app_sat28/models/news_model.dart';
import 'package:new_app_sat28/repository/news_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('News'),
      ),
      body: FutureBuilder(
        future: NewsRepository().getTopBusinessNews(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.hasData) {
            final response = snapshot.data;
            final data = response!.data;

            final newsModel = NewsGeneralResponse.fromJson(data);

            return ListView.builder(
              itemCount: newsModel.articles.length,
              itemBuilder: (context, index) {

                final item = newsModel.articles[index];

                return ListTile(
                  trailing: Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          item.urlToImage ??
                              'https://logowik.com/content/uploads/images/cnbc4159.jpg',
                        ),
                      ),
                    ),
                  ),
                  title: Text(
                    item.title,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  subtitle: Text(
                    item.description ?? 'Empty Description',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  // trailing: Icon(Icons.access_alarm_outlined),
                );
              },
            );
          }

          return const Center(
            child: Text('There is an error, try again!'),
          );
        },
      ),
    );
  }
}
