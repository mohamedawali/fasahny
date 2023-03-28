class SearchResponseModel {
  int? id;
  String? title;
  String? description;
  List<Images>? images;
  bool? isRecommended;
  String? location;
  String? ticketPriceForEgyptions;
  String? ticketPriceForForeing;
  String? ticketPriceForStudents;
  String? videolink;
  int? nomberOfRatings;
  double? workinghoursFrom;
  double? workinghoursTo;
  double? avgOfRating;
  int? views;
  int? loves;
  int? commentsCount;

  SearchResponseModel(
      {this.id,
        this.title,
        this.description,
        this.images,
        this.isRecommended,
        this.location,
        this.ticketPriceForEgyptions,
        this.ticketPriceForForeing,
        this.ticketPriceForStudents,
        this.videolink,
        this.nomberOfRatings,
        this.workinghoursFrom,
        this.workinghoursTo,
        this.avgOfRating,
        this.views,
        this.loves,
        this.commentsCount});

  SearchResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    description = json['description'];
    if (json['images'] != null) {
      images = <Images>[];
      json['images'].forEach((v) {
        images!.add(new Images.fromJson(v));
      });
    }
    isRecommended = json['is_recommended'];
    location = json['location'];
    ticketPriceForEgyptions = json['TicketPriceForEgyptions'];
    ticketPriceForForeing = json['TicketPriceForForeing'];
    ticketPriceForStudents = json['TicketPriceForStudents'];
    videolink = json['videolink'];
    nomberOfRatings = json['nomber_of_ratings'];
    workinghoursFrom = json['workinghours_from'];
    workinghoursTo = json['workinghours_to'];
    avgOfRating = json['avg_of_rating'];
    views = json['views'];
    loves = json['loves'];
    commentsCount = json['comments_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['description'] = this.description;
    if (this.images != null) {
      data['images'] = this.images!.map((v) => v.toJson()).toList();
    }
    data['is_recommended'] = this.isRecommended;
    data['location'] = this.location;
    data['TicketPriceForEgyptions'] = this.ticketPriceForEgyptions;
    data['TicketPriceForForeing'] = this.ticketPriceForForeing;
    data['TicketPriceForStudents'] = this.ticketPriceForStudents;
    data['videolink'] = this.videolink;
    data['nomber_of_ratings'] = this.nomberOfRatings;
    data['workinghours_from'] = this.workinghoursFrom;
    data['workinghours_to'] = this.workinghoursTo;
    data['avg_of_rating'] = this.avgOfRating;
    data['views'] = this.views;
    data['loves'] = this.loves;
    data['comments_count'] = this.commentsCount;
    return data;
  }
}

class Images {
  int? id;
  String? image;
  int? item;

  Images({this.id, this.image, this.item});

  Images.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    image = json['image'];
    item = json['item'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['image'] = this.image;
    data['item'] = this.item;
    return data;
  }
}

