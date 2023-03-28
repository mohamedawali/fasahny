part of 'search_filter_bloc.dart';

@immutable
abstract class SearchFilterEvent {}
class GetCities extends SearchFilterEvent {}
class SearchEvent extends SearchFilterEvent {
 final String ? location;
 final String ? safary;
 final String? who;

  SearchEvent(this.location, this.safary, this.who);
}