part of 'rate_bloc.dart';

@immutable
abstract class RateState {}

class RateInitial extends RateState {}
class RateAdd extends RateState {
 final ResponseRateModel? responseRateModel;

  RateAdd(this.responseRateModel);
}
class GetCommentsState extends RateState {
final  List<CommentsResponseModel> commentsResponse;

  GetCommentsState(this.commentsResponse);
}
