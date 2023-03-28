import 'package:dio/dio.dart';
import '../constant/string.dart';
class RateService{
Dio? _dio;
RateService(this._dio){

  BaseOptions baseOptions=BaseOptions(baseUrl: url);
  _dio=Dio(baseOptions);
}

 Future<Map<String,dynamic>> addRate(int? itemId,String? comment,double? stars, String? token)async{

    BaseOptions baseOptions=BaseOptions(baseUrl: url,headers: {"Authorization":token});
    Response response = await Dio(baseOptions).post('rate/',data:{'itemid':itemId,"stars":stars,'comment':comment} );
return response.data;

  }
Future<List> getComments(int? itemId)async{

  BaseOptions baseOptions=BaseOptions(baseUrl: url);
  Response response = await Dio(baseOptions).get('comments/$itemId');
  return response.data;

}
}