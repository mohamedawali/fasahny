import 'package:bloc/bloc.dart';
import 'package:fasahny/models/allItemsResponse.dart';
import 'package:fasahny/repository/getAllItemsRepo.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

part 'all_items_event.dart';
part 'all_items_state.dart';

class AllItemsBloc extends Bloc<AllItemsEvent, AllItemsState> {
 final GetAllItemsRepo? _allItemsRepo;
 List<Items> itemsList=[];
  AllItemsBloc(this._allItemsRepo) : super(AllItemsInitial()) {
    on<AllItemsEvent>((event, emit)async {
     if(event is GetAllItemsEvent){
       await getAllItems(emit);
     }else if(event is SearchList){

        search(event.text,emit);
     }
    });
  }

  getAllItems(Emitter<AllItemsState> emit) async{
       await   _allItemsRepo!.getAllItems().then((allItems) {itemsList=allItems;emit(GetAllItemsState(allItems));


       }

       );
  }

  void search(String? text, Emitter<AllItemsState> emit) {

    List<Items> list = itemsList.where((element) => element.title!.toLowerCase().contains(text!))
         .toList();

    emit(GetAllItemsState(list));
  }
}
