import 'package:fasahny/models/commentsResponseModel.dart';
import 'package:fasahny/models/responseRateModel.dart';
import 'package:fasahny/webService/rateService.dart';

import '../webService/localDatabase.dart';

class RateRepo {
  String?  token;
  final RateService? _rateService;

  RateRepo(this._rateService);

  Future<ResponseRateModel> addRate(
      int? itemId, String? comment, double? stars) async {
    token=  await SharedPreferenceDataBase.getToken();
    var responseRate = await _rateService!.addRate(itemId, comment, stars,token);
    return ResponseRateModel.fromJson(responseRate);
  }

  Future<List<CommentsResponseModel>> getComments(int? itemId) async {
    var comments = await _rateService!.getComments(itemId);
    var list = comments
        .map((comment) => CommentsResponseModel.fromJson(comment))
        .toList();
    return list;
  }
}
