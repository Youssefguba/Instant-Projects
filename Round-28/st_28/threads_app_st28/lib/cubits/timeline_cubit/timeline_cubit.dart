import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

part 'timeline_state.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit() : super(TimelineInitial());

  void getTimeline() async {
    emit(TimelineLoading());
    final posts = await FirebaseFirestore.instance.collection('posts').get();
    emit(TimelineSuccess(posts.docs));
  }
}
