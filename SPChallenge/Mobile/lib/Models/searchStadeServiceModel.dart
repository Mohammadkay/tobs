class SearchStadeServiceModel {
  List<dynamic> errors;
  int status;
  List<Data>? data;
  int totalRecords;
  SearchStadeServiceModel({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory SearchStadeServiceModel.fromJson(Map<String, dynamic> json) {
    return SearchStadeServiceModel(
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
  String? name;
  String? image;
  String? imageName;
  dynamic stadeProvdiedServices;
  int? id;
  String? creationDate;
  String? createdBy;
  dynamic modificationDate;
  dynamic modifiedBy;

  Data(
      {this.name,
      this.image,
      this.imageName,
      this.stadeProvdiedServices,
      this.id,
      this.creationDate,
      this.createdBy,
      this.modificationDate,
      this.modifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    imageName = json['imageName'];
    stadeProvdiedServices = json['stadeProvdiedServices'];
    id = json['id'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    modificationDate = json['modificationDate'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    data['imageName'] = this.imageName;
    data['stadeProvdiedServices'] = this.stadeProvdiedServices;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
