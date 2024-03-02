import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AddNewPostScreen extends StatefulWidget {
  const AddNewPostScreen({super.key});

  @override
  State<AddNewPostScreen> createState() => _AddNewPostScreenState();
}

class _AddNewPostScreenState extends State<AddNewPostScreen> {

  final postController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('posts').add(
                {
                  'body': postController.text,
                  'profile_picture': FirebaseAuth.instance.currentUser?.photoURL,
                  'name': FirebaseAuth.instance.currentUser?.displayName,
                },
              );
            },
            child: const Text('Post'),
          ),
        ],
      ),
      body: TextFormField(
        maxLines: 50,
        controller: postController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(8),
          hintText: 'Write your post!',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
