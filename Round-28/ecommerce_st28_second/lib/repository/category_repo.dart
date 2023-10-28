import 'package:dio/dio.dart';
import 'package:ecommerce_st28_second/models/category_model.dart';

class CategoryRepo {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
    ),
  );



  Future<List<CategoryItemModel>> getCategories() async {
    //                                                   endpoint
    final response = await dio.get('categories');

    final categoryModel = CategoryModel.fromJson(response.data);

    final categoryData = categoryModel.categoryData.listOfCategories;

    return categoryData;
  }

}