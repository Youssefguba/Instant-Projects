import 'user_model.dart';

class PostModel {
  final String content;
  final String authorId;
  final DateTime createdAt;
  final UserModel? user;
  final String postId;

  bool isFavourite = false;


  PostModel({
    required this.content,
    required this.authorId,
    required this.createdAt,
    this.user,
    required this.postId,
  });

  factory PostModel.fromJson(Map<String, dynamic> json, UserModel user) {
    return PostModel(
      content: json['content'],
      authorId: json['authorId'],
      postId: json['postId'],
      createdAt: DateTime.parse(json['createdAt']),
      user: user,
    );
  }

  factory PostModel.fromSecondJson(Map<String, dynamic> json) {
    return PostModel(
      content: json['content'],
      authorId: json['authorId'],
      postId: json['postId'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }



  // toJson
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'authorId': authorId,
      'createdAt': createdAt,
      'postId': postId,
    };
  }
}
