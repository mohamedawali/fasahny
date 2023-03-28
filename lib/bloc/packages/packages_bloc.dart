import 'package:bloc/bloc.dart';
import 'package:fasahny/models/packagesResponsModel.dart';
import 'package:fasahny/repository/packagesRepo.dart';
import 'package:meta/meta.dart';

part 'packages_event.dart';
part 'packages_state.dart';

class PackagesBloc extends Bloc<PackagesEvent, PackagesState> {
  final PackagesRepo? _packagesRepo;
  PackagesBloc(this._packagesRepo) : super(PackagesInitial()) {
    on<PackagesEvent>((event, emit) async{
if(event is GetPackagesEvent){
  await getPackages(emit);
}
    });
  }

  getPackages(Emitter<PackagesState> emit)async {
    await _packagesRepo!.getPackages().then((packages) => emit(GetPackageState(packages)));
  }
}
