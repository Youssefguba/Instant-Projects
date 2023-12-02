part of 'timeline_cubit.dart';

@immutable
sealed class TimelineState {}

final class TimelineInitial extends TimelineState {}

final class TimelineLoading extends TimelineState {}

final class TimelineSuccess extends TimelineState {
  final List<PostModel> posts;

  TimelineSuccess(this.posts);
}

final class TimelineError extends TimelineState {
  final String message;

  TimelineError(this.message);
}