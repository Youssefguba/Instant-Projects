import 'package:ecommerce_app_sat26/cubits/product_cubit/product_cubit.dart';
import 'package:ecommerce_app_sat26/cubits/single_product_cubit/single_product_cubit.dart';
import 'package:ecommerce_app_sat26/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// file main.dart
// 1. main function
// 2. Widget contains MaterialApp

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SingleProductCubit()),
        BlocProvider(create: (context) => ProductCubit()),
      ],
      child: MaterialApp(
        home: LoginScreen(),
      ),
    );
  }
}


