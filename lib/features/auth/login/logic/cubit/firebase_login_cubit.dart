import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_reader/core/cache/cache_helper.dart';
import 'package:qr_reader/core/cache/cache_keys.dart';
import 'package:qr_reader/features/auth/login/logic/cubit/firebase_login_state.dart';
import 'package:qr_reader/features/auth/login/logic/firebase/firebase_auth_repository.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuthRepository authRepository;

  LoginCubit(this.authRepository) : super(LoginInitial());

  Future<void> login({required String email, required String password}) async {
    emit(LoginLoading());

    try {
      final user = await authRepository.login(email, password);
      if (user != null) {
        await SharedPrefHelper.setSecuredString(
          SharedPrefKeys.userUid,
          user.uid,
        );
        emit(LoginSuccess());
      }
    } on FirebaseAuthException catch (e) {
      emit(LoginFailure(e.message ?? "Login failed. Please try again."));
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await SharedPrefHelper.clearAllSecuredData();
      emit(LoginInitial());
    } catch (e) {
      emit(LoginFailure("Logout failed"));
    }
  }
}
