part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChangedSuccessfully extends CounterState {
  final int counter;

  final Color  randomColor;
  CounterChangedSuccessfully(this.counter, this.randomColor);

}

class CounterGreaterThanTen extends CounterState {}

