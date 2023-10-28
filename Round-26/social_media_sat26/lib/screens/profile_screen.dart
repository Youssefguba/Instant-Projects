import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:social_media_sat26/screens/login_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser;
    final postCollection = FirebaseFirestore.instance.collection('posts');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            ListTile(
              contentPadding: const EdgeInsets.all(12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
                side: const BorderSide(
                  color: Colors.deepPurple,
                  width: 2,
                ),
              ),
              leading: CircleAvatar(
                radius: 32,
                backgroundImage: NetworkImage(user?.photoURL ?? ''),
              ),
              title: Text(user?.displayName ?? ''),
              trailing: TextButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                label: const Text(
                  'Logout',
                ),
                icon: const Icon(
                  Icons.exit_to_app_rounded,
                ),
              ),
            ),
            FutureBuilder(
              future: postCollection
                  .where(
                    'user_id',
                    isEqualTo: user?.uid,
                  )
                  .get(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (snapshot.hasData) {
                  final docs = snapshot.data?.docs;
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: docs!.length,
                    itemBuilder: (context, index) {
                      final post = docs[index].data();
                      final timestamp = (post['createdAt'] as Timestamp)
                          .microsecondsSinceEpoch;
                      final date =
                          DateTime.fromMicrosecondsSinceEpoch(timestamp);
                      final time = DateFormat.yMEd().format(date);
                      return Card(
                        margin: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 12),
                        child: ListTile(
                          leading: CircleAvatar(
                            radius: 25,
                            backgroundImage:
                                NetworkImage(post['profile_picture']),
                          ),
                          title: Text(post['username']),
                          subtitle: Text(post['content']),
                          trailing: Text(time),
                        ),
                      );
                    },
                  );
                }

                return const SizedBox(
                  child: Text('No Posts in this account!'),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
