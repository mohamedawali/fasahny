import 'package:dio/dio.dart';
import 'package:fasahny/webService/localDatabase.dart';
import '../constant/string.dart';

class FavoriteService {
  String? token;

  addFavorite(int itemId, String? token) async {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: url, headers: {"Authorization": token});
    await Dio(baseOptions).post('fav/', data: {'itemid': itemId});
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
    await Dio(baseOptions).post('fav/', data: {'itemid': itemId});
  }

  Future<Map<String, dynamic>> checkFavorite(int itemId, String? token) async {
    BaseOptions baseOptions =
        BaseOptions(baseUrl: url, headers: {"Authorization": token});
    Response response = await Dio(baseOptions).get('check/$itemId');
    return response.data;
  }
}
