import 'package:dio/dio.dart';

class NewsRepository {
  final _dio = Dio();

  Future<Response> getTopBusinessNews() async {
    final res = await _dio.get('https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=b3bcb22d12334c048e68ed3dee9b4550');
    return res;
  }
}

void main() {
  NewsRepository().getTopBusinessNews();
}

// // DON'T DO THIS AT HOMEEEE !!!!!
// void main() async {
//   Future.delayed(Duration(seconds: 3), () => print('Executed after 3 seconds'));
//   print('Hello World!');
//   final test = await printTest();
//   print(test);
//   Future.delayed(Duration(seconds: 2), () => print('Executed after 2 seconds $test'));
//   print('Hey! $test');
//   Future.delayed(Duration(seconds: 1), () => print('Executed after 1 seconds $test'));
// }
// Future<String> printTest() {
//   final Future<String> value = Future.value('Hello after Future');
//   return value;
// }
