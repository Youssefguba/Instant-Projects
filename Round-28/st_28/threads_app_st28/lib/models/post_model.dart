import 'user_model.dart';

class PostModel {
  final String content;
  final String authorId;
  final DateTime createdAt;
  final UserModel user;

  PostModel({
    required this.content,
    required this.authorId,
    required this.createdAt,
    required this.user,
  });

  factory PostModel.fromJson(Map<String, dynamic> json, UserModel user) {
    return PostModel(
      content: json['content'],
      authorId: json['authorId'],
      createdAt: DateTime.parse(json['createdAt']),
      user: user,
    );
  }

  // toJson
  Map<String, dynamic> toJson() {
    return {
      'content': content,
      'authorId': authorId,
      'createdAt': createdAt,
    };
  }
}
