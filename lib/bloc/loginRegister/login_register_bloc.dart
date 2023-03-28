import 'package:bloc/bloc.dart';
import 'package:fasahny/webService/localDatabase.dart';
import 'package:meta/meta.dart';
import '../../models/loginResponsModel.dart';
import '../../models/registerResponse.dart';
import '../../repository/loginRegisterRepo.dart';

part 'login_register_event.dart';
part 'login_register_state.dart';

class LoginRegisterBloc extends Bloc<LoginRegisterEvent, LoginRegisterState> {
  final LoginRegisterRepo?  _loginRegisterRepo;


  LoginRegisterBloc(this._loginRegisterRepo) : super(LoginRegisterInitial()) {
    on<LoginRegisterEvent>((event, emit)async {

      if(event is Login) {
        await login(event. email, event. password,emit);
      }else if(event is Register){
        await register(event.name,event.email,event.password,emit);
      }else if(event is Logout){
        await logout(emit);
      }else if(event is CheckLoginEvent){
        await checkLogin(emit);
      }
    });
  }


  Future login(String? name,String? password, Emitter<LoginRegisterState> emit)async {
    emit(LoadingState());
   await _loginRegisterRepo!.login(name!, password!).then((value) {
     emit(LoginLoaded(value));
    });

  }

  register(String? name, String? email, String? password, Emitter<LoginRegisterState> emit) async{

    emit(LoadingState());
    await _loginRegisterRepo!.register(name!,email!, password!).then((value) {
      emit(RegisterLoaded(value));
    });
  }

  logout(Emitter<LoginRegisterState> emit) async{
   await _loginRegisterRepo!.logout();
    emit(Logouts());
  }

  checkLogin(Emitter<LoginRegisterState> emit)async {

    await SharedPreferenceDataBase.getToken().then((token) => emit(CheckLoginState(token)));
  }

}
