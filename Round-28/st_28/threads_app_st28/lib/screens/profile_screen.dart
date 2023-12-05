import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final userId = FirebaseAuth.instance.currentUser!.uid;

    /// Better
    // FirebaseFirestore.collection('users').doc(userId).get();

    /// BAD
    // FirebaseFirestore.collection('users').where('userId', isEquals: userId).get();


    return Center(
      child: TextButton(
        onPressed: () {
          FirebaseAuth.instance.signOut();
        },
        child: const Text('Logout'),
      ),
    );
  }
}
