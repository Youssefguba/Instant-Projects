import 'package:bloc/bloc.dart';
import 'package:ecommerce_st28_second/repository/user_repoistory.dart';
import 'package:meta/meta.dart';

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
    final response = await userRepository.registerNewUser(name, phone, email, password);

  }
}
