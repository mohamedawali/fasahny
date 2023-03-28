import 'package:dio/dio.dart';
import '../constant/string.dart';


class RecommendRecentService{
  Dio? _dio;

  RecommendRecentService(this._dio){
  BaseOptions baseOption=  BaseOptions(baseUrl: url);
  _dio=Dio(baseOption);
  }
 Future<List> getRecommendView()async{
   Response response = await _dio!.get('recommended');

  return response.data;
  }
  Future<List> getRecentView()async{
    Response response = await _dio!.get('recent');

    return response.data;
  }
}