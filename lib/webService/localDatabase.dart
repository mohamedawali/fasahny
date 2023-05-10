import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataBase{
static SharedPreferences? _sharedPreferences;
static  Future  saveToken(String? token)async {
   await SharedPreferences.getInstance().then((instance) => _sharedPreferences=instance);
var bool = await _sharedPreferences!.setString("token", "Token $token");
   print('bool$bool');
  }
static Future<String?>  getToken()async {
  await SharedPreferences.getInstance().then((instance) => _sharedPreferences=instance);
  var token = _sharedPreferences!.getString("token");
  print('gets$token');
    return token;
}
static Future<void>  removeToken()async {
  await SharedPreferences.getInstance().then((instance) => _sharedPreferences=instance);
  await _sharedPreferences!.remove("token");
}

}