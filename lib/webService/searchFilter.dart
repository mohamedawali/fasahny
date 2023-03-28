import 'package:dio/dio.dart';

import '../constant/string.dart';

class SearchFilterService{
  Dio? _dio;
  SearchFilterService(this._dio){
    _dio=Dio(BaseOptions(baseUrl: url));

  }
  Future<Map<String,dynamic>>  cities()async{
    Response response = await _dio!.get('cities/');
      return response.data;
  }
  Future<List>  search(String? location, String? safary, String? who)async{
    Response response = await _dio!.get('filter/$location/$safary/$who/');
    return response.data;
  }
}