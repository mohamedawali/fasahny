import 'package:fasahny/models/citiesResponse.dart';
import 'package:fasahny/models/searchResponse.dart';

import '../webService/searchFilter.dart';

class SearchFilterRepo {
  SearchFilterService? _filterService;

  SearchFilterRepo(this._filterService);

  Future<CitiesResponseModel> cities() async {
    var cities = await _filterService!.cities();
    var citiesResponseModel = CitiesResponseModel.fromJson(cities);
    return citiesResponseModel;
  }

 Future <List<SearchResponseModel>>search(String? location, String? safary, String? who) async{
   var searchList = await _filterService!.search(location,safary,who);
   return searchList.map((search) => SearchResponseModel.fromJson(search)).toList();
  }
}
