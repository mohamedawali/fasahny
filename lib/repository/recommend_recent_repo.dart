import 'package:fasahny/models/recommend_recent _model.dart';
import 'package:fasahny/webService/recommend_recent_service.dart';

class RecommendRecentRepo{
  RecommendRecentService? recommendService;

  RecommendRecentRepo(this.recommendService);

  Future<List<RecommendRecentViewModel>> getRecommendView()async{
    var response = await recommendService!.getRecommendView();
 var recommendList = response.map((e) => RecommendRecentViewModel.fromJson(e)).toList();

    return recommendList;
  }
  Future<List<RecommendRecentViewModel>> getRecentView()async{
    var response = await recommendService!.getRecentView();
    var recentList = response.map((e) => RecommendRecentViewModel.fromJson(e)).toList();

    return recentList;
  }

}