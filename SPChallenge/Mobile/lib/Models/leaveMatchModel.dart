class LeaveMatchModel {
  List<dynamic> errors;
  int status;
  bool? data;
  int totalRecords;

  LeaveMatchModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory LeaveMatchModel.fromJson(Map<String, dynamic> json) {
    return LeaveMatchModel(
      errors: json['errors'] != null ? json['errors'] : [],
      status: json['status'] != null ? json['status'] : 0,
      data: json['data'] != null ? json['data'] : null,
      totalRecords: json['totalRecords'] != null ? json['totalRecords'] : 0,
    );
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errors'] = this.errors.map((v) => v.toJson()).toList();
    data['status'] = this.status;
    data['data'] = this.data;
    data['totalRecords'] = this.totalRecords;
    return data;
  }
}
