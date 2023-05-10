part of 'login_register_bloc.dart';

@immutable
abstract class LoginRegisterState {}

class LoginRegisterInitial extends LoginRegisterState {}
class LoadingState extends LoginRegisterState {}

class LoginLoaded extends LoginRegisterState {
 final LoginResponseModel loginResponse;
  LoginLoaded(this.loginResponse);
}
class RegisterLoaded extends LoginRegisterState {
 final  RegisterResponse registerResponse;
  RegisterLoaded(this. registerResponse);
}
class CheckLoginState extends LoginRegisterState {
 final String?token;
  CheckLoginState(this.token);
}
class ShowHide extends LoginRegisterState {
bool? secure;
bool? secure2;
 ShowHide(this.secure,this.secure2);
}
class Logouts extends LoginRegisterState {
  Logouts();
}

