part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitial extends CartState {}

class ItemIsAdded extends CartState {
  final String productName;

  ItemIsAdded(this.productName);

}
