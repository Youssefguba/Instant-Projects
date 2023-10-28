import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final postController = TextEditingController();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Post'),
        actions: [
          TextButton(
            child: const Text('Post'),
            onPressed: () async {
              setState(() {
                isLoading = true;
              });
              // 1. Collection Posts [x]
              // 2. extract the post content
              // 3. extract the username
              // 4. extract the profilepicutre
              // 5. createdAt
              // 6. post id

              if (postController.text.isNotEmpty) {
                final postCollection =
                    FirebaseFirestore.instance.collection('posts');
                final docId = postCollection.doc().id;

                // postCollection.add();

                await postCollection.doc(docId).set(
                  {
                    'content': postController.text,
                    'username': FirebaseAuth.instance.currentUser?.displayName,
                    'user_id': FirebaseAuth.instance.currentUser?.uid,
                  },
                  SetOptions(merge: true),
                );

                await postCollection.doc(docId).set(
                  {
                    'profile_picture':
                        FirebaseAuth.instance.currentUser?.photoURL,
                    'createdAt': DateTime.now(),
                    'post_id': docId,
                  },
                  SetOptions(merge: true),
                );

                postController.clear();

                Navigator.of(context).pop();

                setState(() {
                  isLoading = false;
                });
              }
            },
          ),
        ],
      ),
      body: isLoading == false
          ? TextFormField(
              controller: postController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 12),
                hintText: 'Write your post!',
                border: InputBorder.none,
              ),
              maxLines: 50,
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
