import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:threads_sat28/screens/add_new_post_screen.dart';
import 'package:threads_sat28/screens/login_screen.dart';
import 'package:threads_sat28/screens/profile_screen.dart';
import 'package:threads_sat28/screens/search_screen.dart';
import 'package:threads_sat28/screens/timeline_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  final List<Widget> _screens = [
    const TimeLineScreen(),
    const SearchScreen(),
    const AddNewPostScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        } ,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_rounded,
            ),
            label: '',
          ),

          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
            ),
            label: '',
          ),
        ],
      ),
      body: _screens[currentIndex],
    );
  }
}
