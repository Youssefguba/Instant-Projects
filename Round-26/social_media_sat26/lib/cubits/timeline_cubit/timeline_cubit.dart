import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit() : super(TimelineInitial());

  void fetchAllPosts() async {
    emit(TimelineLoadingState());
    final postCollection = FirebaseFirestore.instance.collection('posts');
    final query = await postCollection.get();
    emit(TimelineSuccessState(query.docs));
  }
}
