import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:social_media_sat26/screens/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (FirebaseAuth.instance.currentUser != null) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ),
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset('assets/images/pattern.png'),
          OutlinedButton(
            onPressed: () async {
              final UserCredential userData = await signInWithGoogle();

              uploadUserData(userData);

              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) => const HomeScreen(),
                ),
                (route) => false,
              );
            },
            child: ListTile(
              title: const Text(
                'Log in with Google',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: const Text(
                'Youssefguba',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Image.asset('assets/images/logo_google.png'),
            ),
          ),
        ],
      ),
    );
  }

  void uploadUserData(UserCredential userData) {
    final database = FirebaseFirestore.instance;

    database.collection('users').doc(userData.user?.uid).set(
      {
        'name': userData.user?.displayName,
        'photoURL': userData.user?.photoURL,
      },
      SetOptions(merge: true),
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser =
        await GoogleSignIn(scopes: ['profile', 'email']).signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
