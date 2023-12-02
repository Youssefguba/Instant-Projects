import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int counter = 0;

  List<Color> listOfColors = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.yellow,
    Colors.purple,
    Colors.orange,
    Colors.pink,
    Colors.teal,
    Colors.lime,
    Colors.cyan,
    Colors.amber,
    Colors.indigo,
    Colors.brown,
    Colors.grey,
    Colors.blueGrey,
  ];

  void incrementCounter() {

    final int random = Random().nextInt(listOfColors.length);
    final randomColor = listOfColors[random];

    if(random >= 1000) return;

    counter++;
    // if (counter >= 10) {
    //   emit(CounterGreaterThanTen());
    // } else {
    emit(CounterChangedSuccessfully(counter, randomColor));
    Future.delayed(const Duration(milliseconds: 300), incrementCounter);

    // Recursion
    // }
  }
}
