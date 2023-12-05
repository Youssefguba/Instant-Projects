import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';
import 'package:threads_app_st28/models/post_model.dart';

import '../../utils/firebase_keys.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitial());

  void getFavourites() async {
    final userId = FirebaseAuth.instance.currentUser?.uid;

    final favourites = await FirebaseFirestore.instance
        .collection(CollectionNames.favouriteCollection)
        .where('userId', isEqualTo: userId)
        .get();

    final listOfPosts = [];
    for (final doc in favourites.docs) {
      final postId = doc.data()['postId'];
      final post = await FirebaseFirestore.instance
          .collection('posts')
          .where('postId', isEqualTo: postId)
          .get();

      for (final singlePost in post.docs) {
        final postModel = PostModel.fromSecondJson(singlePost.data());
        listOfPosts.add(postModel);
      }
    }
  }
}
