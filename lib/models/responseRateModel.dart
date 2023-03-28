class ResponseRateModel {
  String? message;
  Data? data;

  ResponseRateModel({this.message, this.data});

  ResponseRateModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  int? id;
  int? user;
  int? item;
  int? rate;

  Data({this.id, this.user, this.item, this.rate});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    item = json['item'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user'] = this.user;
    data['item'] = this.item;
    data['rate'] = this.rate;
    return data;
  }
}
