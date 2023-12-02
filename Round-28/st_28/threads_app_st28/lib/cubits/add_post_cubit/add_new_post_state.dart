part of 'add_new_post_cubit.dart';

@immutable
sealed class AddNewPostState {}

final class AddNewPostInitial extends AddNewPostState {}

final class AddNewPostLoading extends AddNewPostState {}

final class AddNewPostSuccess extends AddNewPostState {}

final class AddNewPostError extends AddNewPostState {
  final String message;

  AddNewPostError(this.message);
}