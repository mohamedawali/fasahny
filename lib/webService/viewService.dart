import 'package:dio/dio.dart';

import '../constant/string.dart';
import 'localDatabase.dart';

class ViewService{

  addView(int view, int itemId, String? token) async{
    BaseOptions baseOptions=BaseOptions(baseUrl: url,headers: {"Authorization":token});
 await Dio(baseOptions).post('views/',data:{'itemid':itemId,"view":view} );
    

  }
}