import 'package:bloc/bloc.dart';
import 'package:ecommerce_app_sat26/repositories/cart_repo.dart';
import 'package:meta/meta.dart';

part 'single_product_state.dart';

class SingleProductCubit extends Cubit<SingleProductState> {
  SingleProductCubit() : super(SingleProductInitial());


  void addItemToProduct(int id) async {

    final data = await CartRepo().addItemToCart(id);
    print(data);
  }

}
