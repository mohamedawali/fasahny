part of 'login_register_bloc.dart';

@immutable
abstract class LoginRegisterEvent {}

class Login extends LoginRegisterEvent {
 final String ?email, password;

  Login(this.email, this.password);

}
  class Register extends LoginRegisterEvent{
  final String ?name,email, password;

  Register(this.name, this.email, this.password);
}

class CheckLoginEvent extends LoginRegisterEvent{


  CheckLoginEvent();
}
class ShowHideEvent extends LoginRegisterEvent{

final bool isSecure;
final int fieldIndex;
  ShowHideEvent(this.isSecure, this.fieldIndex);
}
class Logout extends LoginRegisterEvent{



}
