import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:threads_app_st28/screens/home_screen.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  void initState() {
    super.initState();
    print('My current user ${FirebaseAuth.instance.currentUser}');

    // Future.delayed(const Duration(seconds: 2), () {
    //   if (FirebaseAuth.instance.currentUser != null) {
    //     Navigator.of(context).pushAndRemoveUntil(
    //       MaterialPageRoute(
    //         builder: (context) {
    //           return const HomeScreen();
    //         },
    //       ),
    //       (route) => false,
    //     );
    //   }
    // });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseAuth.instance.userChanges(),
      builder: (context, snapshot) {
        final user = snapshot.data;
        if(user != null) {
          return const HomeScreen();
        } else {
          return Scaffold(
            backgroundColor: Colors.black,
            body: Column(
              children: [
                Image.asset('assets/images/background_img.png'),
                Container(
                  margin: const EdgeInsets.all(12),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: const Color(0xff191919),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      signInWithGoogle();
                    },
                    child: const ListTile(
                      title: Text(
                        'Login with Google',
                        style: TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        '@Youssefguba',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }
    );
  }

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn(
      scopes: ['profile', 'email'],
    ).signIn();

    googleUser?.clearAuthCache();

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
