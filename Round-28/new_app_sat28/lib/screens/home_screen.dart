import 'package:flutter/material.dart';
import 'package:new_app_sat28/models/news_model.dart';
import 'package:new_app_sat28/repository/news_repository.dart';
import 'package:new_app_sat28/screens/article_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<NewsGeneralResponse> newsBusiness;

  @override
  void initState() {
    super.initState();
    newsBusiness = NewsRepository().getTopBusinessNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        setState(() {
          newsBusiness = NewsRepository().getTopBusinessNews();
        });
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        body: FutureBuilder(
          future: newsBusiness,
          builder: (context, snapshot) {
            // Waiting
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            if (snapshot.hasData) {
              final newsModel = snapshot.data!;

              return ListView.builder(
                itemCount: newsModel.articles.length,
                itemBuilder: (context, index) {
                  final Article item = newsModel.articles[index];

                  return ListTile(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            return ArticleScreen(articleItem: item);
                          },
                        ),
                      );
                    },
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
                  );
                },
              );
            }

            return const Center(
              child: Text('There is an error, try again!'),
            );
          },
        ),
      ),
    );
  }
}
