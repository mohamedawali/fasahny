import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../constant/string.dart';

class RandomImageService{
  Future<List> randomImage(String? token) async {
     var res;
    try {
      Response response = await Dio(BaseOptions(baseUrl: url, headers: {"Authorization":token})).get('slider/');
      res = response.data;
    } on DioError catch (e) {
      res = e.response!.data;
    }
    return res;

}}