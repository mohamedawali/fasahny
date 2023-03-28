class RandomIMageResponseModel {
  String? imageUrl;

  RandomIMageResponseModel({this.imageUrl});

  RandomIMageResponseModel.fromJson(Map<String, dynamic> json) {
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['imageUrl'] = this.imageUrl;
    return data;
  }
}