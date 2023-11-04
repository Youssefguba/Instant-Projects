import 'package:ecommerce_st28_second/cubits/auth_cubit/auth_cubit.dart';
import 'package:ecommerce_st28_second/screens/login_screen.dart';
import 'package:ecommerce_st28_second/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp(title: 'Lafyuu App'));
}

class MyApp extends StatefulWidget {
  final String title;

  const MyApp({super.key, required this.title});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: widget.title,
        home: SplashScreen(),
      ),
    );
  }
}
