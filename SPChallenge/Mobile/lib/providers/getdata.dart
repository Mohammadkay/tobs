import 'dart:convert';
// import 'package:alhoot/Share/global.dart';
// import 'package:alhoot/Share/sharedpreference.dart';
// import 'package:alhoot/models/datetime.dart';
// import 'package:alhoot/models/externalmodel.dart';
// import 'package:alhoot/models/internalinternalmodel.dart';
// import 'package:alhoot/models/internalmodel.dart';
// import 'package:alhoot/models/orderdetails.dart';
// import 'package:alhoot/models/ordermodel.dart';
// import 'package:alhoot/models/purchasesmodel.dart';
// import 'package:alhoot/models/purchasesmodelPubgCorea.dart';
// import 'package:alhoot/models/purchasesmodelpubg.dart';
// import 'package:alhoot/models/time.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:spchallange/Models/APIModel.dart';
import 'package:spchallange/Models/signinModel.dart';
import 'package:spchallange/Services/environment.dart';

import '../Models/addPlayersModel.dart';
import '../Models/getAllMathcPlayerModel.dart';
import '../Models/getPalyerInfoByUserNameModel.dart';
import '../Models/joinMatchModel.dart';
import '../Models/leaveMatchModel.dart';
import '../Models/loadPlayerStatisticsModel.dart';
import '../Models/searchMatchModel.dart';
import '../Models/searchStadeServiceModel.dart';
import '../Models/stadeModel.dart';
import '../Models/updatePlayersModel.dart';

class GetData with ChangeNotifier {
  final apiRequest = ApiRequest();
  // final JsonDecoder _decoder = new JsonDecoder();
  final storage = FlutterSecureStorage();
  bool header = true;
//Start Login API's
//fetchlogin
  String? statusLogIn;
  var messagelogin;
  var jsonFetchLogInResult;
  Future<String> fetchLogIn(var userName, var password) async {
    const theUrl = "$BASE_URL/api/Login";
    var response = await apiRequest.makeRequest(
        theUrl,
        HttpMethod.POST,
        json.encode({
          'userName': userName,
          'password': password,
        }),
        !header);

    final int statusCode = response.statusCode;
    final result = response.data;
    SignInResponse signInModel = SignInResponse.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = signInModel.status;
        if (jsonStatus == 1) {
          jsonFetchLogInResult = signInModel.data!.user;
          await storage.write(
              key: 'user', value: jsonFetchLogInResult.toString());
          await storage.write(
              key: 'access_token', value: signInModel.data!.token);
          final accessToken = await storage.read(key: 'access_token');
          print(accessToken.toString());
          statusLogIn = "success";
          return statusLogIn!;
        } else {
          messagelogin = signInModel.errors[0];
          statusLogIn = "fail";
          return statusLogIn!;
        }
      } catch (err) {
        statusLogIn = "fail";
        return statusLogIn!;
      }
    } else {
      messagelogin = signInModel.errors[0];
      statusLogIn = "fail";
      return statusLogIn!;
    }
  }
//End Login API's

//Start Player & User API's
//fetchAddPlayers
  String? statusAddPlayers;
  var messageAddPlayers;
  var jsonFetchAddPlayersResult;
  Future<String> fetchAddPlayers(var data) async {
    const theUrl = "$BASE_URL/api/Users/AddPlayers";
    var response = await apiRequest.makeRequest(
        theUrl, HttpMethod.POST, json.encode(data), header);

    final int statusCode = response.statusCode;
    final result = response.data;
    AddPlayersModel addPlayers = AddPlayersModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = addPlayers.status;
        if (jsonStatus == 1) {
          jsonFetchAddPlayersResult = addPlayers.data!;
          statusAddPlayers = "success";
          return statusAddPlayers!;
        } else {
          messageAddPlayers = addPlayers.errors[0];
          statusAddPlayers = "fail";
          return statusAddPlayers!;
        }
      } catch (err) {
        statusAddPlayers = "fail";
        return statusAddPlayers!;
      }
    } else {
      messageAddPlayers = addPlayers.errors[0];
      statusAddPlayers = "fail";
      return statusAddPlayers!;
    }
  }

//fetchGetPalyerInfoByUserName
  String? statusGetPalyerInfoByUserName;
  var messageGetPalyerInfoByUserName;
  var jsonFetchGetPalyerInfoByUserName;
  Future<String> fetchGetPalyerInfoByUserName() async {
    const theUrl = "$BASE_URL/api/Users/GetPalyerInfoByUserName/Player";

    var response =
        await apiRequest.makeRequest(theUrl, HttpMethod.GET, null, header);

    final int statusCode = response.statusCode;
    final result = response.data;
    GetPalyerInfoByUserNameModel getPalyerInfoByUserName =
        GetPalyerInfoByUserNameModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = getPalyerInfoByUserName.status;
        if (jsonStatus == 1) {
          jsonFetchGetPalyerInfoByUserName = getPalyerInfoByUserName.data!;
          statusGetPalyerInfoByUserName = "success";
          return statusGetPalyerInfoByUserName!;
        } else {
          messageGetPalyerInfoByUserName = getPalyerInfoByUserName.errors[0];
          statusGetPalyerInfoByUserName = "fail";
          return statusGetPalyerInfoByUserName!;
        }
      } catch (err) {
        statusGetPalyerInfoByUserName = "fail";
        return statusGetPalyerInfoByUserName!;
      }
    } else {
      messageGetPalyerInfoByUserName = getPalyerInfoByUserName.errors[0];
      statusGetPalyerInfoByUserName = "fail";
      return statusGetPalyerInfoByUserName!;
    }
  }

//fetchUpdatePlayers
  String? statusUpdatePlayers;
  var messageUpdatePlayers;
  var jsonFetchUpdatePlayers;
  Future<String> fetchUpdatePlayers() async {
    const theUrl = "$BASE_URL/api/Users/UpdatePlayers";
    var response = await apiRequest.makeRequest(
        theUrl,
        HttpMethod.PUT,
        json.encode({
          "userName": "NewPlayer",
          "firstName": "NewPlayer",
          "lastName": "NewPlayer",
          "gender": 1,
          "mobileNo": "0794444444444",
          "email": "NewPlayer@SPCHALLANE.COM",
          "birthDate": "2000-01-25T13:36:44.795",
          "password": "",
          "address": "Amman2",
          "status": 1,
          "userType": 2,
          "image":
              "https://localhost:7012/api/Image?ImageName=MDBhNTgwMDMtMDhiZi00NDA0LWI5OWUtODZmYTNhZjgyM2Jm.PNG&ImageType=1",
          "imageName": "MDBhNTgwMDMtMDhiZi00NDA0LWI5OWUtODZmYTNhZjgyM2Jm.PNG",
          "points": 20,
          "id": 6,
          "modifiedBy": "Admin",
          "createdBy": "Admin"
        }),
        header);

    final int statusCode = response.statusCode;
    final result = response.data;
    UdatePlayerModel udatePlayerModel = UdatePlayerModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = udatePlayerModel.status;
        if (jsonStatus == 1) {
          jsonFetchUpdatePlayers = udatePlayerModel.data!;
          statusUpdatePlayers = "success";
          return statusUpdatePlayers!;
        } else {
          messageUpdatePlayers = udatePlayerModel.errors[0];
          statusUpdatePlayers = "fail";
          return statusAddPlayers!;
        }
      } catch (err) {
        statusUpdatePlayers = "fail";
        return statusUpdatePlayers!;
      }
    } else {
      messageUpdatePlayers = udatePlayerModel.errors[0];
      statusUpdatePlayers = "fail";
      return statusUpdatePlayers!;
    }
  }

//fetchLoadPlayerStatistics
  String? statusLoadPlayerStatistics;
  var messageLoadPlayerStatistics;
  var jsonFetchLoadPlayerStatistics;
  Future<String> fetchLoadPlayerStatistics() async {
    const theUrl = "$BASE_URL/api/Users/LoadPlayerStatistics?UserID=7";
    var response =
        await apiRequest.makeRequest(theUrl, HttpMethod.PUT, null, header);

    final int statusCode = response.statusCode;
    final result = response.data;
    LoadPlayerStatisticsModel loadPlayerStatisticsModel =
        LoadPlayerStatisticsModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = loadPlayerStatisticsModel.status;
        if (jsonStatus == 1) {
          jsonFetchUpdatePlayers = loadPlayerStatisticsModel.data!;
          statusLoadPlayerStatistics = "success";
          return statusLoadPlayerStatistics!;
        } else {
          messageLoadPlayerStatistics = loadPlayerStatisticsModel.errors[0];
          statusLoadPlayerStatistics = "fail";
          return statusLoadPlayerStatistics!;
        }
      } catch (err) {
        statusLoadPlayerStatistics = "fail";
        return statusLoadPlayerStatistics!;
      }
    } else {
      messageLoadPlayerStatistics = loadPlayerStatisticsModel.errors[0];
      statusLoadPlayerStatistics = "fail";
      return statusLoadPlayerStatistics!;
    }
  }

//End Player & User API's

//Start Stade API's
//fetchStade
  String? statusStade;
  var messageStade;
  var jsonFetchStade;
  Future<String> fetchStade() async {
    const theUrl = "$BASE_URL/api/Stade/Get/3";
    var response =
        await apiRequest.makeRequest(theUrl, HttpMethod.GET, null, header);

    final int statusCode = response.statusCode;
    final result = response.data;
    StadeModel stadeModel = StadeModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = stadeModel.status;
        if (jsonStatus == 1) {
          jsonFetchStade = stadeModel.data!;
          statusStade = "success";
          return statusStade!;
        } else {
          messageStade = stadeModel.errors[0];
          statusStade = "fail";
          return statusStade!;
        }
      } catch (err) {
        statusStade = "fail";
        return statusStade!;
      }
    } else {
      messageStade = stadeModel.errors[0];
      statusStade = "fail";
      return statusStade!;
    }
  }

//End Stade API's

//Start StadeServices API's
//fetchSearchStadeService
  String? statusSearchStadeService;
  var messageSearchStadeService;
  var jsonFetchSearchStadeService;
  Future<String> fetchSearchStadeService() async {
    const theUrl = "$BASE_URL/api/StadeServices/SearchStadeService";
    var response = await apiRequest.makeRequest(theUrl, HttpMethod.POST,
        json.encode({"stadeId": 1, "pageSize": 100, "pageNo": 1}), header);

    final int statusCode = response.statusCode;
    final result = response.data;
    SearchStadeServiceModel searchStadeServiceModel =
        SearchStadeServiceModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = searchStadeServiceModel.status;
        if (jsonStatus == 1) {
          jsonFetchSearchStadeService = searchStadeServiceModel.data!;
          statusSearchStadeService = "success";
          return statusSearchStadeService!;
        } else {
          messageSearchStadeService = searchStadeServiceModel.errors[0];
          statusSearchStadeService = "fail";
          return statusSearchStadeService!;
        }
      } catch (err) {
        statusSearchStadeService = "fail";
        return statusSearchStadeService!;
      }
    } else {
      messageSearchStadeService = searchStadeServiceModel.errors[0];
      statusSearchStadeService = "fail";
      return statusSearchStadeService!;
    }
  }

//End StadeServices API's

//Start Match API's
//fetchSearchMatch
  String? statusSearchMatch;
  var messageSearchMatch;
  var jsonFetchSearchMatch;
  Future<String> fetchSearchMatch() async {
    const theUrl = "$BASE_URL/api/Match/SearchMatch";
    var response = await apiRequest.makeRequest(
        theUrl,
        HttpMethod.POST,
        json.encode({
          "id": null,
          "startDateFrom": "2021-01-01T17:52:12.664Z",
          "endDateTo": "2025-01-29T17:52:12.664Z",
          "gender": null,
          "ageFrom": null,
          "ageTo": null,
          "price": null,
          "stadeId": null,
          "pageSize": 100,
          "pageNo": 1
        }),
        header);

    final int statusCode = response.statusCode;
    final result = response.data;
    SearchMatch searchMatch = SearchMatch.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = searchMatch.status;
        if (jsonStatus == 1) {
          jsonFetchSearchMatch = searchMatch.data!;
          statusSearchMatch = "success";
          return statusSearchMatch!;
        } else {
          messageSearchMatch = searchMatch.errors[0];
          statusSearchMatch = "fail";
          return statusSearchMatch!;
        }
      } catch (err) {
        statusSearchMatch = "fail";
        return statusSearchMatch!;
      }
    } else {
      messageSearchMatch = searchMatch.errors[0];
      statusSearchMatch = "fail";
      return statusSearchMatch!;
    }
  }

//fetchJoinMatch
  String? statusJoinMatch;
  var messageJoinMatch;
  var jsonFetchJoinMatch;
  Future<String> fetchJoinMatch() async {
    const theUrl = "$BASE_URL/api/Match/JoinMatch";
    var response = await apiRequest.makeRequest(
        theUrl,
        HttpMethod.POST,
        json.encode({
          "id": 0,
          "creationDate": "2024-05-27T17:53:36.577Z",
          "createdBy": "Player",
          "modificationDate": null,
          "modifiedBy": null,
          "userId": 3,
          "matchId": 6,
          "reviewId": null
        }),
        header);

    final int statusCode = response.statusCode;
    final result = response.data;
    JoinMatchModel joinMatchModel = JoinMatchModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = joinMatchModel.status;
        if (jsonStatus == 1) {
          jsonFetchJoinMatch = joinMatchModel.data!;
          statusJoinMatch = "success";
          return statusJoinMatch!;
        } else {
          messageJoinMatch = joinMatchModel.errors[0];
          statusJoinMatch = "fail";
          return statusJoinMatch!;
        }
      } catch (err) {
        statusJoinMatch = "fail";
        return statusJoinMatch!;
      }
    } else {
      messageJoinMatch = joinMatchModel.errors[0];
      statusJoinMatch = "fail";
      return statusJoinMatch!;
    }
  }

//fetchLeaveMatch
  String? statusLeaveMatch;
  var messageLeaveMatch;
  var jsonFetchLeaveMatch;
  Future<String> fetchLeaveMatch() async {
    const theUrl = "$BASE_URL/api/Match/LeaveMatch?MatchId=2&UserId=8";
    var response =
        await apiRequest.makeRequest(theUrl, HttpMethod.DELETE, null, header);

    final int statusCode = response.statusCode;
    final result = response.data;
    LeaveMatchModel leaveMatchModel = LeaveMatchModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = leaveMatchModel.status;
        if (jsonStatus == 1) {
          jsonFetchLeaveMatch = leaveMatchModel.data!;
          statusLeaveMatch = "success";
          return statusLeaveMatch!;
        } else {
          messageLeaveMatch = leaveMatchModel.errors[0];
          statusLeaveMatch = "fail";
          return statusLeaveMatch!;
        }
      } catch (err) {
        statusLeaveMatch = "fail";
        return statusLeaveMatch!;
      }
    } else {
      messageLeaveMatch = leaveMatchModel.errors[0];
      statusLeaveMatch = "fail";
      return statusLeaveMatch!;
    }
  }

//fetchGetAllMathcPlayer
  String? statusGetAllMathcPlayer;
  var messageGetAllMathcPlayer;
  var jsonFetchGetAllMathcPlayer;
  Future<String> fetchGetAllMathcPlayer() async {
    const theUrl = "$BASE_URL/api/Match/GetAllMathcPlayer?MatchId=1";
    var response =
        await apiRequest.makeRequest(theUrl, HttpMethod.DELETE, null, header);

    final int statusCode = response.statusCode;
    final result = response.data;
    GetAllMathcPlayerModel getAllMathcPlayerModel =
        GetAllMathcPlayerModel.fromJson(result);
    if (statusCode == 200) {
      try {
        var jsonStatus = getAllMathcPlayerModel.status;
        if (jsonStatus == 1) {
          jsonFetchGetAllMathcPlayer = getAllMathcPlayerModel.data!;
          statusGetAllMathcPlayer = "success";
          return statusGetAllMathcPlayer!;
        } else {
          messageGetAllMathcPlayer = getAllMathcPlayerModel.errors[0];
          statusGetAllMathcPlayer = "fail";
          return statusGetAllMathcPlayer!;
        }
      } catch (err) {
        statusGetAllMathcPlayer = "fail";
        return statusGetAllMathcPlayer!;
      }
    } else {
      messageGetAllMathcPlayer = getAllMathcPlayerModel.errors[0];
      statusGetAllMathcPlayer = "fail";
      return statusGetAllMathcPlayer!;
    }
  }

//End Match API's

  notifyListeners();
}
