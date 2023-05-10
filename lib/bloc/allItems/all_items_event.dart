part of 'all_items_bloc.dart';

@immutable
abstract class AllItemsEvent {}
class GetAllItemsEvent extends AllItemsEvent{

}
class SearchList extends AllItemsEvent{
final String text;

SearchList(this.text);
}