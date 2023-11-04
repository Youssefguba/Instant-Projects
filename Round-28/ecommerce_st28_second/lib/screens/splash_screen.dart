import 'package:ecommerce_st28_second/screens/login_screen.dart';
import 'package:ecommerce_st28_second/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        getToken();
      },
    );
  }

  void getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('access-token');
    if(token != null && token.isNotEmpty) {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
            (route) => false,
      );
    } else {
      Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(
          builder: (_) => LoginScreen(),
        ),
            (route) => false,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image.asset(
          'assets/images/white_logo.png',
          height: 72,
          width: 72,
        ),
      ),
    );
  }
}
