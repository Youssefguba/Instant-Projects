import 'package:ecommerce_app_sat26/screens/account_screen.dart';
import 'package:ecommerce_app_sat26/screens/cart_screen.dart';
import 'package:ecommerce_app_sat26/screens/explore_screen.dart';
import 'package:ecommerce_app_sat26/screens/main_screen.dart';
import 'package:ecommerce_app_sat26/screens/offer_screen.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomeScreen extends StatefulWidget {

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int screenIndex = 0;

  // controller / wrapper
  List<Widget> _screens = [
    // Main Screen
    MainScreen(),

    // Explore Screen
    ExploreScreen(),

    // Cart Screen
    CartScreen(),

    // Offer screen
    OfferScreen(),

    // account screen
    AccountScreen(),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: screenIndex,
        onTap: (int index) {
          print('This is the index $index');
          setState(() {
            screenIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
            ),
            label: 'Home'
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
            ),
            label: 'Explore'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.shopping_cart,
              ),
              label: 'Cart'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_offer_outlined,
              ),
              label: 'Offer'
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline_rounded,
              ),
              label: 'Account'
          ),
        ],
      ),
      body: _screens[screenIndex],
    );
  }
}
