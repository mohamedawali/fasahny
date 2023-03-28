import 'package:bloc/bloc.dart';
import 'package:fasahny/models/citiesResponse.dart';
import 'package:meta/meta.dart';

import '../../models/searchResponse.dart';
import '../../repository/searchFilter.dart';

part 'search_filter_event.dart';
part 'search_filter_state.dart';

class SearchFilterBloc extends Bloc<SearchFilterEvent, SearchFilterState> {
  final SearchFilterRepo? _searchFilterRepo;
  SearchFilterBloc(this._searchFilterRepo) : super(SearchFilterInitial()) {
    on<SearchFilterEvent>((event, emit) async{
     if(event is GetCities){
       await getCities(emit);
     }else if(event is SearchEvent){
       await search(event.location,event.safary,event.who,emit);
     }
    });
  }

  getCities(Emitter<SearchFilterState> emit)async {
    await _searchFilterRepo!.cities().then((cities) {

      emit(LoadedCities(cities));});
  }

  search(String? location, String? safary, String? who, Emitter<SearchFilterState> emit)async {
    await _searchFilterRepo!.search(location,safary,who).then((value) {

      emit(GetSearchState(value));
    });


  }
}
