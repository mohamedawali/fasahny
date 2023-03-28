class CitiesResponseModel {
  String? name;
  String? database;
  List<Data>? data;

  CitiesResponseModel({this.name, this.database, this.data});

  CitiesResponseModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    database = json['database'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['database'] = this.database;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? id;
  String? governorateNameAr;
  String? governorateNameEn;

  Data({this.id, this.governorateNameAr, this.governorateNameEn});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    governorateNameAr = json['governorate_name_ar'];
    governorateNameEn = json['governorate_name_en'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['governorate_name_ar'] = this.governorateNameAr;
    data['governorate_name_en'] = this.governorateNameEn;
    return data;
  }
}
