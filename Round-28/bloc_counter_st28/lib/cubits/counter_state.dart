part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChangedSuccessfully extends CounterState {
  final int counter;

  CounterChangedSuccessfully(this.counter);

}
class CounterGreaterThanTen extends CounterState {}

