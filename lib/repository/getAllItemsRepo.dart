import 'package:fasahny/models/allItemsResponse.dart';

import '../webService/getAllItemsService.dart';

class GetAllItemsRepo{
  final GetAllItemsService? _allItemsService;

  GetAllItemsRepo(this._allItemsService);

  Future<List<Items>> getAllItems()async{
var allItems = await _allItemsService!.getAllItems();
var list = AllItemsResponsModel.fromJson(allItems).items!.toList();
    return AllItemsResponsModel.fromJson(allItems).items!.toList();
  }
}