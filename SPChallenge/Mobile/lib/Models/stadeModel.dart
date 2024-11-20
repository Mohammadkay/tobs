class StadeModel {
  List<dynamic> errors;
  int status;
  Data? data;
  int totalRecords;

  StadeModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory StadeModel.fromJson(Map<String, dynamic> json) {
    return StadeModel(
      errors: json['errors'] != null ? json['errors'] : [],
      status: json['status'] != null ? json['status'] : 0,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      totalRecords: json['totalRecords'] != null ? json['totalRecords'] : 0,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors.map((v) => v.toJson()).toList();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['totalRecords'] = this.totalRecords;
    return data;
  }
}

class Data {
  String? name;
  String? mobileNo;
  String? email;
  String? address;
  int? status;
  String? statusDes;
  String? longitude;
  String? latitude;
  dynamic image;
  String? imageName;
  int? capacity;
  int? stadeType;
  dynamic stadeProvdiedServices;
  dynamic matchs;
  int? id;
  String? creationDate;
  String? createdBy;
  dynamic modificationDate;
  dynamic modifiedBy;

  Data(
      {this.name,
      this.mobileNo,
      this.email,
      this.address,
      this.status,
      this.statusDes,
      this.longitude,
      this.latitude,
      this.image,
      this.imageName,
      this.capacity,
      this.stadeType,
      this.stadeProvdiedServices,
      this.matchs,
      this.id,
      this.creationDate,
      this.createdBy,
      this.modificationDate,
      this.modifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    address = json['address'];
    status = json['status'];
    statusDes = json['statusDes'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    image = json['image'];
    imageName = json['imageName'];
    capacity = json['capacity'];
    stadeType = json['stadeType'];
    stadeProvdiedServices = json['stadeProvdiedServices'];
    matchs = json['matchs'];
    id = json['id'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    modificationDate = json['modificationDate'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['address'] = this.address;
    data['status'] = this.status;
    data['statusDes'] = this.statusDes;
    data['longitude'] = this.longitude;
    data['latitude'] = this.latitude;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['capacity'] = this.capacity;
    data['stadeType'] = this.stadeType;
    data['stadeProvdiedServices'] = this.stadeProvdiedServices;
    data['matchs'] = this.matchs;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
