part of 'profile_bloc.dart';

@immutable
abstract class ProfileState {}

class ProfileInitial extends ProfileState {}
class ChangeState extends ProfileState {
  final int currentIndex;
  ChangeState(this. currentIndex);
}
class ProfileData extends ProfileState {
  final ProfileResponseModel data;
  ProfileData(this.data);
}

class LoadedImage extends ProfileState {
 final String image;
  LoadedImage(this.image);
}
