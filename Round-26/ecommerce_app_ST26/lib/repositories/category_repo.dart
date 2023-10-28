import 'package:dio/dio.dart';

class CategoryRepo {
  final dio = Dio();

  Future<Response> getCategories() async {
    // final Response res = await dio.get('https://mocki.io/v1/e5775744-06ba-4306-b6f6-93055de3c2d5');
    final Response res =
        await dio.get('https://student.valuxapps.com/api/categories');
    return res;
  }

  Future<Response> getCategoryDetails(int id) async {
    final Response res =
        await dio.get('https://student.valuxapps.com/api/categories/$id');
    return res;
  }
}
