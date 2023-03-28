import 'package:dio/dio.dart';

import '../constant/string.dart';

class PackagesService{
  Dio? _dio;
  PackagesService(this._dio){
    _dio=Dio(BaseOptions(baseUrl: url));

  }
 Future<List> getPackages()async{
    Response response = await _dio!.get('packages/');

    return response.data;

  }
}