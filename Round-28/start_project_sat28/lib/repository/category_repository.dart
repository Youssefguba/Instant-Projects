import 'package:dio/dio.dart';
import 'package:start_project_sat28/model/category_model.dart';

class CategoryRepository {

  Future<CategoryModel> getCategories()  async {
    final response = await Dio().get('https://student.valuxapps.com/api/categories');
    print(response.data['data']['data'][1]['name']);

    // لأغراض تعليمية
    // final category = CategoryModel(
    //   status: response.data['status'],
    //   data: response.data['data'],
    //   message: response.data['message'],
    // );

    final categoryData = CategoryModel.fromJsonToCategoryModel(response.data);

    print(categoryData.data.data[3].image);

    return categoryData;
  }
}
