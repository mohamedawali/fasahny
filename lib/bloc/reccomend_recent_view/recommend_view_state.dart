part of 'recommend_view_bloc.dart';

@immutable
abstract class RecommendViewState {}

class RecommendViewInitial extends RecommendViewState {}
class GetRecommendViewState extends RecommendViewState {
 final List<RecommendRecentViewModel> recommendList;
  GetRecommendViewState(this. recommendList);

}
