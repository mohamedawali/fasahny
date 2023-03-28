part of 'all_items_bloc.dart';

@immutable
abstract class AllItemsState {}

class AllItemsInitial extends AllItemsState {}

class GetAllItemsState extends AllItemsState {
 final List<Items>? itemsList;
  GetAllItemsState(this.itemsList);
}