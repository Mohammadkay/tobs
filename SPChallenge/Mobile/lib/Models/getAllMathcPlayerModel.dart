class GetAllMathcPlayerModel {
  List<dynamic> errors;
  int status;
  List<Data>? data;
  int totalRecords;
  GetAllMathcPlayerModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory GetAllMathcPlayerModel.fromJson(Map<String, dynamic> json) {
    return GetAllMathcPlayerModel(
      errors: json['errors'] != null ? json['errors'] : [],
      status: json['status'] != null ? json['status'] : 0,
      data: json['data'] != null ? parseData(json['data']) : null,
      totalRecords: json['totalRecords'] != null ? json['totalRecords'] : 0,
    );
  }
  static List<Data>? parseData(dynamic json) {
    if (json is List) {
      return json.map((data) => Data.fromJson(data)).toList();
    } else if (json is Map<String, dynamic>) {
      // If it's a single item, create a list with a single element
      return [Data.fromJson(json)];
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors.map((v) => v.toJson()).toList();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
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
  String? address;
  int? status;
  int? passwordTries;
  String? notes;
  String? lastLoginDate;
  int? userType;
  String? image;
  String? imageName;
  int? points;
  dynamic playerStatistics;
  dynamic matchs;
  int? id;
  String? creationDate;
  String? createdBy;
  String? modificationDate;
  dynamic modifiedBy;

  Data(
      {this.userName,
      this.firstName,
      this.lastName,
      this.gender,
      this.mobileNo,
      this.email,
      this.birthDate,
      this.address,
      this.status,
      this.passwordTries,
      this.notes,
      this.lastLoginDate,
      this.userType,
      this.image,
      this.imageName,
      this.points,
      this.playerStatistics,
      this.matchs,
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
    address = json['address'];
    status = json['status'];
    passwordTries = json['passwordTries'];
    notes = json['notes'];
    lastLoginDate = json['lastLoginDate'];
    userType = json['userType'];
    image = json['image'];
    imageName = json['imageName'];
    points = json['points'];
    playerStatistics = json['playerStatistics'];
    matchs = json['matchs'];
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
    data['address'] = this.address;
    data['status'] = this.status;
    data['passwordTries'] = this.passwordTries;
    data['notes'] = this.notes;
    data['lastLoginDate'] = this.lastLoginDate;
    data['userType'] = this.userType;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['points'] = this.points;
    data['playerStatistics'] = this.playerStatistics;
    data['matchs'] = this.matchs;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
