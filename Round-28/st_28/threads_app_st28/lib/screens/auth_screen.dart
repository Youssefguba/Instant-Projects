import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              onPressed: () {},
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
