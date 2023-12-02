part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChanged extends CounterState {
  final int counter;

  final Color randomColor;

  CounterChanged(this.counter, this.randomColor);
}

class CounterSuccess extends CounterState {}