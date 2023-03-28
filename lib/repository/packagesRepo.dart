import 'package:fasahny/models/packagesResponsModel.dart';
import 'package:fasahny/webService/pakagesService.dart';

class PackagesRepo {
  final PackagesService? _packagesService;

  PackagesRepo(this._packagesService);

  Future<List<PackagesResponseModel>> getPackages() async {
    var list = await _packagesService!.getPackages();
return list.map((package) => PackagesResponseModel.fromJson(package)).toList();

  }
}
