class CommentsResponseModel {
  String? comment;
  String? user;
  int? rate;

  CommentsResponseModel({this.comment, this.user, this.rate});

  CommentsResponseModel.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    user = json['user'];
    rate = json['rate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['user'] = this.user;
    data['rate'] = this.rate;
    return data;
  }
}
