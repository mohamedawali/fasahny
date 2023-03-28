import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceDataBase{
static SharedPreferences? _sharedPreferences;
static  Future  saveToken(String? token)async {
   await SharedPreferences.getInstance().then((instance) => _sharedPreferences=instance);
await _sharedPreferences!.setString("token", "Token $token");

  }
static Future<String?>  getToken()async {
  await SharedPreferences.getInstance().then((instance) => _sharedPreferences=instance);
return _sharedPreferences!.getString("token");
}
static Future<void>  removeToken()async {
  await SharedPreferences.getInstance().then((instance) => _sharedPreferences=instance);
  await _sharedPreferences!.remove("token");
}

}