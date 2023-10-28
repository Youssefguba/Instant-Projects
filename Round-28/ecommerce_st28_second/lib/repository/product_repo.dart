import 'package:dio/dio.dart';

class ProductRepo {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
    ),
  );

  Future<dynamic> getProductsByCategoryId(int categoryId) async {
    final response = await dio.get('products?category_id=$categoryId');
    return response.data['data']['data'];
  }

  Future<dynamic> getProductsByCategoryIdInFirebase(int categoryId) async {
    final response = await dio.get('products?category_id=$categoryId');
    return response.data['data']['data'];
  }

}