import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:threads_app_st28/models/post_model.dart';
import 'package:threads_app_st28/utils/firebase_keys.dart';

import '../../models/user_model.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit() : super(TimelineInitial());

  void getTimeline() async {
    try {
      emit(TimelineLoading());

      // posts
      final posts = await FirebaseFirestore.instance
          .collection(CollectionNames.postCollection)
          .orderBy('createdAt', descending: true)
          .get();

      List<PostModel> listOfPosts = [];
      // loop on all posts and return user that write post , uId = postID

      for (final post in posts.docs) {
        final fetchedUser = await FirebaseFirestore.instance
            .collection(CollectionNames.userCollection)
            .where('userId', isEqualTo: post.data()['authorId'])
            .get();

        // this will return more than user , one user in each iteration.
        final user = UserModel.fromJson(fetchedUser.docs.first.data());

        final modelPost = PostModel.fromJson(post.data(), user);

        listOfPosts.add(modelPost);
      }

      emit(TimelineSuccess(listOfPosts));
    } catch (e) {
      print(e.toString());
    }
  }
}
