import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:threads_sat28/firebase_options.dart';
import 'package:threads_sat28/screens/test_splash_screen.dart';

import 'screens/login_screen.dart';
import 'screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: TestLoginScreen(),
    );
  }
}


