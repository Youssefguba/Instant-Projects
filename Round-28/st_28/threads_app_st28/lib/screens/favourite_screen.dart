import 'package:flutter/material.dart';
import 'package:threads_app_st28/widgets/post_widget.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 100,
      itemBuilder: (BuildContext context, int index) {
        return const PostWidget();
      },
    );

  }
}
