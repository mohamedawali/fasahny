part of 'packages_bloc.dart';

@immutable
abstract class PackagesState {}

class PackagesInitial extends PackagesState {}
class GetPackageState extends PackagesState {
 final List<PackagesResponseModel>? packages;
  GetPackageState(this.packages);
}
