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
class SelectHangout extends SearchFilterEvent {
 final String hangout;

 SelectHangout(this.hangout);
}
class SelectGo extends SearchFilterEvent {
 final String goWith;

 SelectGo(this.goWith);
}
class SelectCity extends SearchFilterEvent {
 final String city;

 SelectCity(this.city);
}