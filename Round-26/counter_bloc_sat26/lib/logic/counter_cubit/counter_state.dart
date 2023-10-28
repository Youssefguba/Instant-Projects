part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterChangedSuccessfully extends CounterState {
  final int counter;
  CounterChangedSuccessfully(this.counter);
}

class CounterFailed extends CounterState {}

class CounterSuccess extends CounterState {}

class CounterLoading extends CounterState {}

class CounterNoInternet extends CounterState {}

class CounterDataIsEmpty extends CounterState {}
