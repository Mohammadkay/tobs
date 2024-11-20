class SearchMatch {
  List<dynamic> errors;
  int status;
  List<Data>? data;
  int totalRecords;

  SearchMatch({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory SearchMatch.fromJson(Map<String, dynamic> json) {
    return SearchMatch(
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
  String? startDate;
  String? endDate;
  int? capacity;
  int? gender;
  int? ageFrom;
  int? ageTo;
  double? price;
  int? stadeId;
  dynamic stade;
  dynamic manOfTheGameId;
  dynamic manOfTheGame;
  int? id;
  String? creationDate;
  String? createdBy;
  dynamic modificationDate;
  dynamic modifiedBy;

  Data(
      {this.name,
      this.startDate,
      this.endDate,
      this.capacity,
      this.gender,
      this.ageFrom,
      this.ageTo,
      this.price,
      this.stadeId,
      this.stade,
      this.manOfTheGameId,
      this.manOfTheGame,
      this.id,
      this.creationDate,
      this.createdBy,
      this.modificationDate,
      this.modifiedBy});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    capacity = json['capacity'];
    gender = json['gender'];
    ageFrom = json['ageFrom'];
    ageTo = json['ageTo'];
    price = json['price'];
    stadeId = json['stadeId'];
    stade = json['stade'];
    manOfTheGameId = json['manOfTheGameId'];
    manOfTheGame = json['manOfTheGame'];
    id = json['id'];
    creationDate = json['creationDate'];
    createdBy = json['createdBy'];
    modificationDate = json['modificationDate'];
    modifiedBy = json['modifiedBy'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['startDate'] = this.startDate;
    data['endDate'] = this.endDate;
    data['capacity'] = this.capacity;
    data['gender'] = this.gender;
    data['ageFrom'] = this.ageFrom;
    data['ageTo'] = this.ageTo;
    data['price'] = this.price;
    data['stadeId'] = this.stadeId;
    data['stade'] = this.stade;
    data['manOfTheGameId'] = this.manOfTheGameId;
    data['manOfTheGame'] = this.manOfTheGame;
    data['id'] = this.id;
    data['creationDate'] = this.creationDate;
    data['createdBy'] = this.createdBy;
    data['modificationDate'] = this.modificationDate;
    data['modifiedBy'] = this.modifiedBy;
    return data;
  }
}
