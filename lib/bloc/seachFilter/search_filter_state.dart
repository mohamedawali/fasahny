part of 'search_filter_bloc.dart';

@immutable
abstract class SearchFilterState {}

class SearchFilterInitial extends SearchFilterState {}

class LoadedCities extends SearchFilterState {
 final CitiesResponseModel? cities;
  LoadedCities(this.cities);
}
class HangoutState extends SearchFilterState {
 final String hangout;
 HangoutState(this.hangout);
}
class GoState extends SearchFilterState {
 final String goWith;
 GoState(this.goWith);
}
class CityState extends SearchFilterState {
 final String city;
 CityState(this.city);
}
class GetSearchState extends SearchFilterState {
final List<SearchResponseModel>? searchList;

GetSearchState(this.searchList);
}