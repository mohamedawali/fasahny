import 'package:dio/dio.dart';
import '../constant/string.dart';

class GetAllItemsService{
  Dio? _dio;
  GetAllItemsService(this._dio){
  _dio=Dio(BaseOptions(baseUrl: url));

  }
Future<Map<String,dynamic>>  getAllItems()async{
    Response response = await _dio!.get('items/');
    return response.data;
  }
}