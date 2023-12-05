import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'add_new_post_state.dart';

class AddNewPostCubit extends Cubit<AddNewPostState> {
  AddNewPostCubit() : super(AddNewPostInitial());

  final TextEditingController controller = TextEditingController();

  Future<void> addPost(BuildContext context) async {
    try {
      if (controller.text.isNotEmpty) {
        emit(AddNewPostLoading());

        final id = FirebaseFirestore.instance.collection('posts').doc().id;
        await FirebaseFirestore.instance.collection('posts').doc(id).set({
          'postId': id,
          'content': controller.text,
          'authorId': FirebaseAuth.instance.currentUser?.uid,
          'createdAt': DateTime.now().toString(),
        });

        controller.clear();

        // Navigator.of(context).pop();

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post created successfully'),
            backgroundColor: Colors.green,
          ),
        );

        emit(AddNewPostSuccess());
        
      } else {

        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Post cannot be empty'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (e) {
      emit(AddNewPostError(e.toString()));
    }
  }
}
