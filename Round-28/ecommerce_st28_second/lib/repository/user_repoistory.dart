import 'package:dio/dio.dart';

class UserRepository {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://student.valuxapps.com/api/',
    ),
  );

  Future<Response> registerNewUser(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    final response = await dio.post(
      'register',
      data: {
        "name": name,
        "phone": phone,
        "email": email,
        "password": phone,
        "image": "",
      },
    );

    return response;
  }
}
