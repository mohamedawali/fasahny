import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../models/favoriteModel.dart';
import '../../repository/favoriteRepo.dart';

part 'favorite_event.dart';
part 'favorite_state.dart';

class FavoriteBloc extends Bloc<FavoriteEvent, FavoriteState> {
  final FavoriteRepo? _favoriteRepo;
  FavoriteBloc(this._favoriteRepo) : super(FavoriteInitial()) {
    on<FavoriteEvent>((event, emit) async {

      if (event is AddFavoriteEvent) {
        await addFavorite( event.itemId);
      }  else if (event is GetFavoriteEvent) {
        await getFavorite(emit);
      }else if (event is DeleteFavoriteEvent) {
        await deleteFavorite(emit,event.itemId);
      } else if (event is CheckFavoriteEvent) {
        await checkFavorite(emit,event.itemId);
      }
    });
  }

  addFavorite( int? itemId)async {
   await _favoriteRepo!.addFavorite(itemId!);
  }

  getFavorite(Emitter<FavoriteState> emit) async {

    await _favoriteRepo!
        .getFavorite()
        .then((favoriteList) {
      print('bbb${favoriteList.length}');
      emit(GetFavoriteStat(favoriteList));});
  }

  checkFavorite(Emitter<FavoriteState> emit, int? itemId) async{
     await _favoriteRepo!.checkFavorite( itemId!).then((value) => emit(CheckFavoriteStat(value!)));

  }

  deleteFavorite(Emitter<FavoriteState> emit, int? itemId) {
     _favoriteRepo!
        .deleteFavorite(itemId!);



  }

}
