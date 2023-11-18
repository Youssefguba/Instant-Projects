import 'package:dio/dio.dart';

import '../models/news_model.dart';

class NewsRepository {
  final Dio _dio = Dio();

  Future<NewsGeneralResponse> getTopBusinessNews() async {
    final Response res = await _dio.get(
      'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b3bcb22d12334c048e68ed3dee9b4550',
    );
    print('this is an error $res');
    final data = NewsGeneralResponse.fromJson(res.data);
    return data;
  }
}
