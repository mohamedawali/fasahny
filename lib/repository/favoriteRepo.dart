import 'package:fasahny/models/checkFavorite.dart';
import 'package:fasahny/models/favoriteModel.dart';
import 'package:fasahny/webService/favoriteService.dart';

import '../webService/localDatabase.dart';

class FavoriteRepo {
 final FavoriteService? _favoriteService ;
String? token;
  FavoriteRepo(this._favoriteService);

  addFavorite(int? itemId) async {
    token=  await SharedPreferenceDataBase.getToken();
    await _favoriteService!.addFavorite(itemId!,token);
  }
Future<List<FavoriteModel>>  getFavorite() async {
  token=  await SharedPreferenceDataBase.getToken();
 var favoriteList=   await _favoriteService!.getFavorite(token);
return favoriteList.map((item) => FavoriteModel.fromJson(item)).toList();
  }
  Future<void>  deleteFavorite(int itemId) async {
    token=  await SharedPreferenceDataBase.getToken();
  await _favoriteService!.deleteFavorite(itemId,token);


  }
 Future<bool?> checkFavorite(int itemId)async{
   token=  await SharedPreferenceDataBase.getToken();
    var checkFavorite=   await _favoriteService!.checkFavorite(itemId,token);
  return  CheckFavoriteModel.fromJson(checkFavorite).status;
  }

}
