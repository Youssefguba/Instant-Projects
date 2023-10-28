import 'package:dio/dio.dart';

class AuthRepo {
  dynamic login(String email, String password) async {
    final response = await Dio().post(
      // ---------BASE URL----------/-- PATH --
      'https://student.valuxapps.com/api/login',
      data: {
        "email": email,
        "password": password,
      },
    );

    print(response);
    return response.data;
  }
}
