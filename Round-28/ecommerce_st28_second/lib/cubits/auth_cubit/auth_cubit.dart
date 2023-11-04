import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:ecommerce_st28_second/models/registration_model.dart';
import 'package:ecommerce_st28_second/repository/user_repoistory.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  final UserRepository userRepository = UserRepository();

  void register(
    String name,
    String phone,
    String email,
    String password,
  ) async {
    try {
      emit(LoadingAuthState());

      final response = await userRepository.registerNewUser(
        name,
        phone,
        email,
        password,
      );

      print(response.data);

      final regRes = RegistrationResponseModel.fromJson(
        response.data,
      );

      SharedPreferences prefs = await SharedPreferences.getInstance();


      if (regRes.status == true) {

        await prefs.setString('access-token', regRes.data?.token ?? '');

        emit(AuthSuccess());
      } else {
        emit(AuthDataNotValid(regRes.message ?? ''));
      }
    }
    // on SocketException catch (e) {
    //   emit(AuthFailedUnExpected(e.message));
    // }
    // on Exception catch (e) {
    //   emit(AuthFailedUnExpected(e.toString()));
    // }
    catch(e) {
      print('Error is $e');
      emit(AuthFailedUnExpected(e.toString()));
    }
  }
}
