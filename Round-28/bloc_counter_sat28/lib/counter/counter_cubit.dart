import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());
  int counter = 0;

  final List<Color> listOfColors = [
    Colors.orange,
    Colors.blue,
    Colors.greenAccent,
    Colors.redAccent,
    Colors.black,
    Colors.white,
    Colors.purple,
    Colors.deepOrange,
    Colors.deepPurple,
  ];

  void incrementCounter() {
    final randomNumber = Random().nextInt(listOfColors.length);
    final randomColor = listOfColors[randomNumber];

    counter += 10;

    emit(CounterChanged(counter, randomColor));

    // recursive - recursion
    Future.delayed(const Duration(milliseconds: 300), incrementCounter);
  }

}
