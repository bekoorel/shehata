import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  void loginWithGoogle() {
    emit(LoginLoading());
    // TODO: Implement Google Sign-In
    emit(LoginSuccess());
  }

  void loginWithOTP(String otp) {
    emit(LoginLoading());
    // TODO: Implement OTP verification
    emit(LoginSuccess());
  }
}
