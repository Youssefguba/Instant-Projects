import 'package:dio/dio.dart';

class CartRepo {

  dynamic addItemToCart(int id) async {
    final response = await Dio().post(
      'https://student.valuxapps.com/api/carts',
      data: {
        "product_id": id,
      },
    );

    return response.data;
  }


}
