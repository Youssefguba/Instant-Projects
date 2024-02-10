import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_app_sat28/cubits/news_cubit/news_cubit.dart';
import 'package:new_app_sat28/models/news_model.dart';
import 'package:new_app_sat28/repository/news_repository.dart';
import 'package:new_app_sat28/screens/article_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    // Get/Fetch News when screen open
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<NewsCubit>().getNews();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('News'),
        ),
        body: BlocListener<NewsCubit, NewsState>(
          listener: (context, state) {
          if(state is NewsNoInternetConnection) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('No Internet Connection'),
                backgroundColor: Colors.red,
              ),
            );
          }
          },
          child: BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (state is NewsSuccess) {
                final NewsGeneralResponse newsModel = state.news;
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
                    });
              }

              if (state is NewsFailed) {
                return Text('Error, try again!');
              }

              return const Text('Hello');
            },
          ),
        ),
      ),
    );
  }
}

// FutureBuilder(
//           future: newsBusiness,
//           builder: (context, snapshot) {
//             // Waiting
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(
//                 child: CircularProgressIndicator(),
//               );
//             }
//
//             if (snapshot.hasData) {
//               final NewsGeneralResponse newsModel = snapshot.data!;
//
//               return ListView.builder(
//                 itemCount: newsModel.articles.length,
//                 itemBuilder: (context, index) {
//                   final Article item = newsModel.articles[index];
//
//                   return ListTile(
//                     onTap: () {
//                       Navigator.of(context).push(
//                         MaterialPageRoute(
//                           builder: (context) {
//                             return ArticleScreen(articleItem: item);
//                           },
//                         ),
//                       );
//                     },
//                     trailing: Container(
//                       height: 60,
//                       width: 60,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(12),
//                         image: DecorationImage(
//                           fit: BoxFit.cover,
//                           image: NetworkImage(
//                             item.urlToImage ??
//                                 'https://logowik.com/content/uploads/images/cnbc4159.jpg',
//                           ),
//                         ),
//                       ),
//                     ),
//                     title: Text(
//                       item.title,
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     subtitle: Text(
//                       item.description ?? 'Empty Description',
//                       style: TextStyle(
//                         color: Colors.grey,
//                       ),
//                       maxLines: 2,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                   );
//                 },
//               );
//             }
//
//             return const Center(
//               child: Text('There is an error, try again!'),
//             );
//           },
//         )
