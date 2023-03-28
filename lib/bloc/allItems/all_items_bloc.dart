import 'package:bloc/bloc.dart';
import 'package:fasahny/models/allItemsResponse.dart';
import 'package:fasahny/repository/getAllItemsRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'all_items_event.dart';
part 'all_items_state.dart';

class AllItemsBloc extends Bloc<AllItemsEvent, AllItemsState> {
 final GetAllItemsRepo? _allItemsRepo;
  AllItemsBloc(this._allItemsRepo) : super(AllItemsInitial()) {
    on<AllItemsEvent>((event, emit)async {
     if(event is GetAllItemsEvent){
       await getAllItems(emit);
     }
    });
  }

  getAllItems(Emitter<AllItemsState> emit) async{
       await   _allItemsRepo!.getAllItems().then((allItems) => emit(GetAllItemsState(allItems)));
  }
}
