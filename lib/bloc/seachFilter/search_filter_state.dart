part of 'search_filter_bloc.dart';

@immutable
abstract class SearchFilterState {}

class SearchFilterInitial extends SearchFilterState {}

class LoadedCities extends SearchFilterState {
 final CitiesResponseModel? cities;
  LoadedCities(this.cities);
}
class GetSearchState extends SearchFilterState {
final List<SearchResponseModel>? searchList;

GetSearchState(this.searchList);
}