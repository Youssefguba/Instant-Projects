part of 'product_cubit.dart';

@immutable
abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductSuccessful extends ProductState {
  final Response response;

  ProductSuccessful(this.response);

}

class ProductFailed extends ProductState {}