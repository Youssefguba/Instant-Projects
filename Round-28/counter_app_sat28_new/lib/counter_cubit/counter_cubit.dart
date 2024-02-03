import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  int value = 0;
  Color _textColor = Colors.black;

  Color get textColor => _textColor;

  void incrementOne() {
    value++;
    _textColor = Colors.red;
    emit(CounterChanged());
  }

  void decrementOne() {
    value--;
    _textColor = Colors.green;

    emit(CounterChanged());
  }

  void incrementTwenty() {
    value += 20;
    _textColor = Colors.orange;

    emit(CounterChanged());
  }

  void decrementTwenty() {
    value -= 20;
    _textColor = Colors.blue;

    emit(CounterChanged());
  }
}
