import 'dart:async';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import '../../models/profileResponseModel.dart';
import '../../repository/profileRepo.dart';
part 'profile_event.dart';
part 'profile_state.dart';
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepo _profileRepo ;

  ProfileBloc(this._profileRepo) : super(ProfileInitial()) {
    on<ProfileEvent>((event, emit)async {
    if(event is GetProfileData){
      await getProfileData(emit);
    }else if(event is UpdateProfileData){
      await updateProfile(event.name,emit);
    }else if(event is SaveImage){
      await saveImage(event.imageFile,emit);
    }else if(event is GetImage){
      await getImage(emit);}
    });
  }

 Future getProfileData(Emitter<ProfileState> emit) async{
    await _profileRepo.getProfileData().then((data) {
         emit(ProfileData(data));
    });
}

 Future getImage(Emitter<ProfileState> emit)async {



    await _profileRepo.getImage().then((value) {

      emit(LoadedImage(value.data!.image!));
    });
  }

  Future saveImage(File imageFile,Emitter<ProfileState> emit) async{

    await _profileRepo.saveImage(imageFile);
  }

  updateProfile(String? name, Emitter<ProfileState> emit) async{
    await _profileRepo.updateProfileData(name!);

  }}
