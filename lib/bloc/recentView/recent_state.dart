part of 'recent_bloc.dart';

@immutable
abstract class RecentState {}

class RecentInitial extends RecentState {}
class GetRecentViewState extends RecentState {
  final List<RecommendRecentViewModel> recentList;
  GetRecentViewState(this. recentList);

}