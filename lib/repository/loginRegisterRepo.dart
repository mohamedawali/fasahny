import 'package:fasahny/models/registerModel.dart';
import 'package:fasahny/models/registerResponse.dart';
import 'package:fasahny/webService/registerService.dart';

import '../models/loginModel.dart';
import '../models/loginResponsModel.dart';
import '../webService/localDatabase.dart';

class LoginRegisterRepo {
  final LoginRegisterService? _loginRegisterService;
  LoginRegisterRepo(this._loginRegisterService);

  Future<RegisterResponse> register(
      String name, String email, String password) async {
    var registerMap = RegisterModel(name, email, password).saveMap();
    var registerResponse = await _loginRegisterService!.register(registerMap);
    RegisterResponse registerFromJson =
        RegisterResponse.fromJson(registerResponse);
    // await  _sharedPreferenceDataBase.saveToken(registerFromJson.token);
    await SharedPreferenceDataBase.saveToken(registerFromJson.token);
    return registerFromJson;
  }

  Future<LoginResponseModel> login(String email, String password) async {
    var loginMap = LoginModel(email, password).saveMap();
    var response = await _loginRegisterService!.login(loginMap);
    var loginResponse = LoginResponseModel.fromJson(response);
    //await _sharedPreferenceDataBase.saveToken(loginResponse.token);
    print('todss${loginResponse.token}');
    await SharedPreferenceDataBase.saveToken(loginResponse.token);
    return loginResponse;
  }

  logout() async {
    String? token;
    token = await SharedPreferenceDataBase.getToken();

    await _loginRegisterService!.logout(token);
  }
}
