part of 'rate_bloc.dart';

@immutable
abstract class RateEvent {}
class AddRate extends  RateEvent {
  final int? itemId;
  final double? stars;
final String? comment;
  AddRate(this.itemId, this.comment,this.stars);
}
class GetComments extends  RateEvent {
 final int? itemId;


  GetComments(this.itemId);
}