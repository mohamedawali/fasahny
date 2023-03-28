class ProfileResponseModel {
//   int? status;
//   Data? data;
//   String? token;
//
//   ProfileResponseModel({this.status, this.data, this.token});
//
//   ProfileResponseModel.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     data = json['data'] != null ? new Data.fromJson(json['data']) : null;
//     token = json['token'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.toJson();
//     }
//     data['token'] = this.token;
//     return data;
//   }
// }
//
// class Data {
//   String? email;
//   String? username;
//   int? id;
//
//   Data({this.email, this.username, this.id});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     email = json['email'];
//     username = json['username'];
//     id = json['id'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['email'] = this.email;
//     data['username'] = this.username;
//     data['id'] = this.id;
//     return data;
//   }
  int? status;
  Data? data;
  String? token;

  ProfileResponseModel({this.status, this.data, this.token});

  ProfileResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['token'] = this.token;
    return data;
  }
}

class Data {
  String? email;
  String? username;
  int? id;
  String? image;

  Data({this.email, this.username, this.id, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    username = json['username'];
    id = json['id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['email'] = this.email;
    data['username'] = this.username;
    data['id'] = this.id;
    data['image'] = this.image;
    return data;
  }
}
