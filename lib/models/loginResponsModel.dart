class LoginResponseModel {
  int? status;
  int? id;
  String? message;
  String? token;

  LoginResponseModel({this.status,this.id ,this.message, this.token});

  LoginResponseModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    id = json['id'];
    message = json['message'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['id'] = this.id;
    data['message'] = this.message;
    data['token'] = this.token;
    return data;
  }
}
