class LoadPlayerStatisticsModel {
  List<dynamic> errors;
  int status;
  Data? data;
  int totalRecords;
  LoadPlayerStatisticsModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory LoadPlayerStatisticsModel.fromJson(Map<String, dynamic> json) {
    return LoadPlayerStatisticsModel(
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
  int? yellowCard;
  int? redCard;
  int? goals;
  int? assist;
  int? userId;
  int? id;
  String? creationDate;
  String? createdBy;
  String? modificationDate;
  String? modifiedBy;

  Data(
      {this.yellowCard,
      this.redCard,
      this.goals,
      this.assist,
      this.userId,
      this.id,
      this.creationDate,
      this.createdBy,
      this.modificationDate,
      this.modifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    yellowCard = json['yellowCard'];
    redCard = json['redCard'];
    goals = json['goals'];
    assist = json['assist'];
    userId = json['userId'];
    id = json['id'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    modificationDate = json['modificationDate'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['yellowCard'] = this.yellowCard;
    data['redCard'] = this.redCard;
    data['goals'] = this.goals;
    data['assist'] = this.assist;
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
