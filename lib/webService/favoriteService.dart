import 'package:dio/dio.dart';
import '../constant/string.dart';

class FavoriteService {
  String? token;

  addFavorite(int itemId, String? token) async {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: url, headers: {"Authorization": token});
    var response = await Dio(baseOptions).post('fav/', data: {'itemid': itemId});
   return response.statusCode;
  }

  Future<List> getFavorite(String? token) async {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: url, headers: {"Authorization": token});
    Response response = await Dio(baseOptions).get('fav/');
    return response.data;
  }

  Future<void> deleteFavorite(int itemId, String? token) async {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: url, headers: {"Authorization": token});
    print('id$itemId');
    var response = await Dio(baseOptions).post('fav/', data: {'itemid': itemId});
    print('sss${response.statusCode}');
  }

  Future<Map<String, dynamic>> checkFavorite(int itemId, String? token) async {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: url, headers: {"Authorization": token});
    Response response = await Dio(baseOptions).get('check/$itemId');
    return response.data;
  }
}
