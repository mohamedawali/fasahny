import 'package:dio/dio.dart';
import '../constant/string.dart';

class ProfileService {
    Future<Map<String,dynamic>> getProfileData(String? token) async {
    var res;
    try {
      Response response = await Dio(
              BaseOptions(baseUrl: url, headers: {"Authorization": token}))
          .get('profile/');
      res = response.data;
    } on DioError catch (e) {
      res = e.response!.data;
      }
    return res;
  }

  Future<Map<String, dynamic>> updateProfileData(String name, String? token) async {
    var res;
    try {
      Response response = await Dio(
          BaseOptions(baseUrl: url, headers: {"Authorization": token}))
          .put('update/',data: {'username':name});
      res = response.data;
    } on DioError catch (e) {
      res = e.response!.data;
    }
    return res;
  }

  Future saveImage(FormData image, String? token) async {
     var res;
    try {
      Response response = await Dio(
              BaseOptions(baseUrl: url, headers: {"Authorization": token}))
          .post('image/', data: image);
      res = response.data;
    } on DioError catch (e) {
      res = e.response!.data;
    }
    return res;
  }
  Future getImage(String? token) async {
    String? token;
    var res;
    try {
      Response response = await Dio(
          BaseOptions(baseUrl: url, headers: {"Authorization": token}))
          .get('image/');
      res = response.data;
    } on DioError catch (e) {
      res = e.response!.data;
    }
    return res;
  }
}
