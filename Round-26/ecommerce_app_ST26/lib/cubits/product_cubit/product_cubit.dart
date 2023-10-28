import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../repositories/category_repo.dart';

part 'product_state.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitial());

  void getProducts(int id) async {
    final response = await CategoryRepo().getCategoryDetails(id);

    emit(ProductSuccessful(response));
  }
}
