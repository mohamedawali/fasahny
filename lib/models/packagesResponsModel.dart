class PackagesResponseModel {

  String? title;
  String? duration;
  String? hotelName;
  String? hoteLocation;
  List<Trips>? trips;

  PackagesResponseModel(
  {this.title,
  this.duration,
  this.hotelName,
  this.hoteLocation,
  this.trips});

  PackagesResponseModel.fromJson(Map<String, dynamic> json) {
  title = json['title'];
  duration = json['duration'];
  hotelName = json['hotel_name'];
  hoteLocation = json['hote_location'];
  if (json['trips'] != null) {
  trips = <Trips>[];
  json['trips'].forEach((v) {
  trips!.add(new Trips.fromJson(v));
  });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['title'] = this.title;
  data['duration'] = this.duration;
  data['hotel_name'] = this.hotelName;
  data['hote_location'] = this.hoteLocation;
  if (this.trips != null) {
  data['trips'] = this.trips!.map((v) => v.toJson()).toList();
  }
  return data;
  }
  }

  class Trips {
  int? id;
  String? location;
  List<Tripimages>? tripimages;

  Trips({this.id, this.location, this.tripimages});

  Trips.fromJson(Map<String, dynamic> json) {
  id = json['id'];
  location = json['location'];
  if (json['tripimages'] != null) {
  tripimages = <Tripimages>[];
  json['tripimages'].forEach((v) {
  tripimages!.add(new Tripimages.fromJson(v));
  });
  }
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['id'] = this.id;
  data['location'] = this.location;
  if (this.tripimages != null) {
  data['tripimages'] = this.tripimages!.map((v) => v.toJson()).toList();
  }
  return data;
  }
  }

  class Tripimages {
  String? image;

  Tripimages({this.image});

  Tripimages.fromJson(Map<String, dynamic> json) {
  image = json['image'];
  }

  Map<String, dynamic> toJson() {
  final Map<String, dynamic> data = new Map<String, dynamic>();
  data['image'] = this.image;
  return data;
  }
  }
