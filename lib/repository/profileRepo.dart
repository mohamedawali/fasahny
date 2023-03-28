import 'dart:io';

import 'package:dio/dio.dart';
import 'package:fasahny/models/profileResponseModel.dart';
import 'package:fasahny/webService/profileService.dart';

import '../models/imageProfileModel.dart';
import '../webService/localDatabase.dart';

class ProfileRepo {
  String ?token;
  final ProfileService? _profileService ;

  ProfileRepo(this._profileService);

  Future<ProfileResponseModel> getProfileData() async {
    token = await SharedPreferenceDataBase.getToken();

    var profileData = await _profileService!.getProfileData(token);
    return ProfileResponseModel.fromJson(profileData);
  }
  Future<ProfileResponseModel> updateProfileData(String name) async {
    token = await SharedPreferenceDataBase.getToken();
    var profileData = await _profileService!.updateProfileData(name,token);
       return ProfileResponseModel.fromJson(profileData);
  }

  Future <ImageProfileResponseModel>saveImage(File imageFile) async {
    token = await SharedPreferenceDataBase.getToken();

    String lastPath = imageFile.path.split('/').last;
    FormData formData = FormData.fromMap({
      'image': await MultipartFile.fromFile(imageFile.path, filename: lastPath)
    });

    var response = await _profileService!.saveImage(formData,token);
return ImageProfileResponseModel.fromJson(response);
  }
  Future <ImageProfileResponseModel>getImage() async {
    token = await SharedPreferenceDataBase.getToken();

    var response = await _profileService!.getImage(token);
    return ImageProfileResponseModel.fromJson(response);
  }
}
