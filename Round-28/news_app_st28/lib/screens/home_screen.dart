import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_st28/cubits/news_cubit/news_cubit.dart';
import 'package:news_app_st28/widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<NewsCubit>().getNews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('News app'),
      ),
      body: BlocBuilder<NewsCubit, NewsState>(
        builder: (context, state) {
          if(state is NewsLoading) {

            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (state is NewsFailed) {
            return const Center(
              child: Text('Failed, Try again!'),
            );
          }

          if(state is NewsSuccess) {
            final data = state.data;
            return ListView.separated(
              itemBuilder: (context, index) {
                final article = data.articles[index];
                return NewsCardWidget(article: article);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              // itemCount: data.articles.length,
              itemCount: data.totalResults,
            );
          }

          return const SizedBox();
        },
      ),
    );
  }
}
