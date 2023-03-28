part of 'profile_bloc.dart';

@immutable
abstract class ProfileEvent {}
class GetProfileData extends ProfileEvent {

}
class UpdateProfileData extends ProfileEvent {
final String? name;

UpdateProfileData(this.name);
}
class GetImage extends ProfileEvent {

}

class SaveImage extends ProfileEvent {
final File imageFile;

SaveImage(this.imageFile);
}