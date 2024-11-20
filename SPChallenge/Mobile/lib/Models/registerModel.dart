class RegistrationData {
  int id;
  String? creationDate;
  String? createdBy;
  String? modificationDate;
  String? modifiedBy;
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
  String? imageName;
  dynamic image;
  int? points;

  RegistrationData({
    required this.id,
    this.creationDate,
    this.createdBy,
    this.modificationDate,
    this.modifiedBy,
    this.userName,
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
    this.imageName,
    this.image,
    this.points,
  });
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "creationDate": creationDate,
      "createdBy": createdBy,
      "modificationDate": modificationDate,
      "modifiedBy": modifiedBy,
      "userName": userName,
      "firstName": firstName,
      "lastName": lastName,
      "gender": gender,
      "mobileNo": mobileNo,
      "email": email,
      "birthDate": birthDate,
      "password": password,
      "address": address,
      "status": status,
      "userType": userType,
      "imageName": imageName,
      "image": image,
      "points": points,
    };
  }
}
