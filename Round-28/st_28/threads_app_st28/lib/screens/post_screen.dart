import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: [
          TextButton(
            onPressed: () {
              FirebaseFirestore.instance.collection('posts').add({
                'content': controller.text,
                'id': FirebaseAuth.instance.currentUser?.uid,
                'createdAt': DateTime.now().toString(),
                'photoUser': FirebaseAuth.instance.currentUser?.photoURL,
              });
            },
            child: const Text('Post'),
          ),
        ],
      ),
      body: TextFormField(
        controller: controller,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.all(12),
          hintText: 'Ehbd Ay kalam',
        ),
        maxLines: 50,
      ),
    );
  }
}
