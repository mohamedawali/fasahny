part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteEvent {}
class AddFavoriteEvent extends  FavoriteEvent {
 final int? itemId;
  AddFavoriteEvent(this. itemId);
}
class GetFavoriteEvent extends  FavoriteEvent {

}
class DeleteFavoriteEvent extends  FavoriteEvent {

 final int? itemId;
  DeleteFavoriteEvent(this. itemId);
}
class CheckFavoriteEvent extends  FavoriteEvent {
 final int? itemId;

  CheckFavoriteEvent(this.itemId);
}


// class AddViewEvent extends  FavoriteEvent {
//   int? view;
//   int? itemId;
//   AddViewEvent(this. view, this. itemId);
// }
