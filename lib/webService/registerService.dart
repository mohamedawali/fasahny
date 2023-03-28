import 'package:dio/dio.dart';
import '../constant/string.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'localDatabase.dart';

class LoginRegisterService {
  Dio? _dio;
  LoginRegisterService(this._dio) {
    BaseOptions baseOptions = BaseOptions(baseUrl: url);

    _dio = Dio(baseOptions);
  }
  Future register(Map<String, dynamic> registerMap) async {
    var responseData;
    try {
      Response response = await _dio!.post('register/', data: registerMap);
      responseData = response.data;
    } on DioError catch (e) {
      responseData = e.response!.data;
          }
    return responseData;
  }

  Future login(Map<String, dynamic> loginMap) async {
    var responseData;
    try {
      Response response = await _dio!.post('login/', data: loginMap);
      responseData = response.data;
    } on DioError catch (error) {
      responseData = error.response!.data;
       }
    return responseData;
  }

  Future logout(String? token) async {
    var responseData;
     try {
      Response response = await Dio(
              BaseOptions(baseUrl: url, headers: {"Authorization": token}))
          .post('logout/');
      responseData = response.data;
    } on DioError catch (error) {
     await SharedPreferenceDataBase.removeToken();
       }
    return responseData;
  }
}
