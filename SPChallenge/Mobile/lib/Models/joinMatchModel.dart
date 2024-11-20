class JoinMatchModel {
  List<dynamic> errors;
  int status;
  Data? data;
  int totalRecords;
  JoinMatchModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory JoinMatchModel.fromJson(Map<String, dynamic> json) {
    return JoinMatchModel(
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
  int? userId;
  dynamic user;
  int? matchId;
  dynamic match;
  dynamic reviewId;
  dynamic review;
  int? id;
  String? creationDate;
  String? createdBy;
  dynamic modificationDate;
  dynamic modifiedBy;

  Data(
      {this.userId,
      this.user,
      this.matchId,
      this.match,
      this.reviewId,
      this.review,
      this.id,
      this.creationDate,
      this.createdBy,
      this.modificationDate,
      this.modifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    user = json['user'];
    matchId = json['matchId'];
    match = json['match'];
    reviewId = json['reviewId'];
    review = json['review'];
    id = json['id'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    modificationDate = json['modificationDate'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['user'] = this.user;
    data['matchId'] = this.matchId;
    data['match'] = this.match;
    data['reviewId'] = this.reviewId;
    data['review'] = this.review;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
