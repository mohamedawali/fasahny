import 'package:fasahny/webService/localDatabase.dart';
import 'package:fasahny/webService/rondamImageService.dart';

import '../models/packagesResponsModel.dart';
import '../models/randomImagrRespons.dart';
import '../models/recommend_recent _model.dart';

class RandomImageRepo{
  final RandomImageService? _randomImageService;

  RandomImageRepo(this._randomImageService);

  Future <List<RandomIMageResponseModel>>randomImage() async {
    String? token;
  token=await  SharedPreferenceDataBase.getToken();
     var images = await _randomImageService!.randomImage(token);
      List<RandomIMageResponseModel> list = images.map((image) => RandomIMageResponseModel.fromJson(image)).toList();
    return list;

}

}
