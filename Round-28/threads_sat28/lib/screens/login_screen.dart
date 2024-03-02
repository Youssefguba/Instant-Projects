import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:threads_sat28/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Image.asset('assets/images/splash.png'),
          OutlinedButton(
            onPressed: () async {
              final userCredential = await signInWithGoogle();

              if(userCredential.user != null) {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(),
                  ),
                );
              }

            },
            child: const ListTile(
              title: Text(
                'Login with Google',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              subtitle: Text(
                '@Youssef Guba',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              trailing: Icon(
                Icons.facebook_rounded,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<UserCredential> signInWithGoogle() async {

    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    googleUser?.clearAuthCache();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}

