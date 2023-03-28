class RegisterResponse {

  int? status;
  String? message;
  Data? data;
  String? token;

  RegisterResponse({this.status, this.message, this.data, this.token});

  RegisterResponse.fromJson(Map<String, dynamic> json) {
  status = json['status'];
  message = json['message'];
  data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  token = json['token'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['status'] = this.status;
  data['message'] = this.message;
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

  Data({this.email, this.username});

  Data.fromJson(Map<String, dynamic> json) {
  email = json['email'];
  username = json['username'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['email'] = this.email;
  data['username'] = this.username;
  return data;
  }
  }
