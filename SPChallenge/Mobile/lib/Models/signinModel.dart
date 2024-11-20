class SignInResponse {
  List<dynamic> errors;
  int status;
  Data? data;
  int totalRecords;

  SignInResponse({
    required this.errors,
    required this.status,
    required this.data,
    required this.totalRecords,
  });

  factory SignInResponse.fromJson(Map<String, dynamic> json) {
    return SignInResponse(
      errors: json['errors'] != null ? json['errors'] : [],
      status: json['status'] != null ? json['status'] : 0,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      totalRecords: json['totalRecords'] != null ? json['totalRecords'] : 0,
    );
  }
}

class Data {
  String token;
  User user;

  Data({
    required this.token,
    required this.user,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      token: json['token'],
      user: User.fromJson(json['user']),
    );
  }
}

class User {
  String userName;
  String firstName;
  String lastName;
  int gender;
  String mobileNo; // Corrected parameter name
  String email;
  String birthDate;
  String password;
  String address;
  int status;
  int userType;
  String? image;
  String? imageName;
  int points;
  int id;
  String creationDate;
  String createdBy;
  String? modificationDate;
  dynamic modifiedBy;

  User({
    required this.userName,
    required this.firstName,
    required this.lastName,
    required this.gender,
    required this.mobileNo, // Corrected parameter name
    required this.email,
    required this.birthDate,
    required this.password,
    required this.address,
    required this.status,
    required this.userType,
    this.image,
    this.imageName,
    required this.points,
    required this.id,
    required this.creationDate,
    required this.createdBy,
    this.modificationDate,
    required this.modifiedBy,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      userName: json['userName'],
      firstName: json['firstName'],
      lastName: json['lastName'],
      gender: json['gender'],
      mobileNo: json['mobileNo'],
      email: json['email'],
      birthDate: json['birthDate'],
      password: json['password'],
      address: json['address'],
      status: json['status'],
      userType: json['userType'],
      image: json['image'],
      imageName: json['imageName'],
      points: json['points'],
      id: json['id'],
      creationDate: json['creationDate'],
      createdBy: json['createdBy'],
      modificationDate: json['modificationDate'],
      modifiedBy: json['modifiedBy'],
    );
  }
}
