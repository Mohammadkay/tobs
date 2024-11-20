class GetPalyerInfoByUserNameModel {
  List<dynamic> errors;
  int status;
  Data? data;
  int totalRecords;

  GetPalyerInfoByUserNameModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory GetPalyerInfoByUserNameModel.fromJson(Map<String, dynamic> json) {
    return GetPalyerInfoByUserNameModel(
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
  String? userName;
  String? firstName;
  String? lastName;
  int? gender;
  String? mobileNo;
  String? email;
  String? birthDate;
  String? password;
  String? address;
  int? status;
  int? userType;
  String? image;
  String? imageName;
  int? points;
  int? id;
  String? creationDate;
  String? createdBy;
  dynamic modificationDate;
  dynamic modifiedBy;

  Data(
      {this.userName,
      this.firstName,
      this.lastName,
      this.gender,
      this.mobileNo,
      this.email,
      this.birthDate,
      this.password,
      this.address,
      this.status,
      this.userType,
      this.image,
      this.imageName,
      this.points,
      this.id,
      this.creationDate,
      this.createdBy,
      this.modificationDate,
      this.modifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    mobileNo = json['mobileNo'];
    email = json['email'];
    birthDate = json['birthDate'];
    password = json['password'];
    address = json['address'];
    status = json['status'];
    userType = json['userType'];
    image = json['image'];
    imageName = json['imageName'];
    points = json['points'];
    id = json['id'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    modificationDate = json['modificationDate'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userName'] = this.userName;
    data['firstName'] = this.firstName;
    data['lastName'] = this.lastName;
    data['gender'] = this.gender;
    data['mobileNo'] = this.mobileNo;
    data['email'] = this.email;
    data['birthDate'] = this.birthDate;
    data['password'] = this.password;
    data['address'] = this.address;
    data['status'] = this.status;
    data['userType'] = this.userType;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['points'] = this.points;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
