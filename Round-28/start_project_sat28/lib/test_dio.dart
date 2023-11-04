import 'package:dio/dio.dart';

final dio = Dio();

void getHttp() async {
  print('Hey!');
  final response = await dio.get('https://student.valuxapps.com/api/home');
  print(response.statusCode);
  print(response);
  print('Instant');
}

// DON'T DO THIS AT HOME !!
void main() {
  getHttp();
}