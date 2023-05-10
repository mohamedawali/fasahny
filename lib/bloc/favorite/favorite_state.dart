part of 'favorite_bloc.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitial extends FavoriteState {}
class AddFavoriteStat extends FavoriteState {
  final int add;
  AddFavoriteStat(this. add);
}
class GetFavoriteStat extends FavoriteState {
 final List<FavoriteModel>? favoriteList;
  GetFavoriteStat(this. favoriteList);
}
class CheckFavoriteStat extends FavoriteState {
final bool isFavorite;
  CheckFavoriteStat(this. isFavorite);
}
