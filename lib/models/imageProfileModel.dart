



class ImageProfileResponseModel {


  int? status;
  Data? data;

  ImageProfileResponseModel({this.status, this.data});

  ImageProfileResponseModel.fromJson(Map<String, dynamic> json) {
  status = json['status'];
  data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['status'] = status;
  if (this.data != null) {
  data['data'] = this.data!.toJson();
  }
  return data;
  }
  }

  class Data {
  String? image;
  int? id;

  Data({this.image, this.id});

  Data.fromJson(Map<String, dynamic> json) {
  image = json['image'];
  id = json['id'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = <String, dynamic>{};
  data['image'] = image;
  data['id'] = id;
  return data;
  }
  }


