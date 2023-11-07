import 'package:dio/dio.dart';

import '../utils/constants.dart';

class NewsRepo {
  final Dio _dio = Dio(BaseOptions(baseUrl: baseUrl));

  Future<Response> fetchNews() async {

    final Response res = await _dio.get(
      "top-headlines",
      queryParameters: {
        "sources": "techcrunch",
        "apiKey": apiKey,
      },
    );

    return res;
  }
}