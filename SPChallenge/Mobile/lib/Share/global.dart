import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

double height = 0.0;
double width = 0.0;
SharedPreferences? prefs;
TextEditingController codeLE = TextEditingController();
TextEditingController codeLP = TextEditingController();
TextEditingController codeREmail = TextEditingController();
TextEditingController codeRPassword = TextEditingController();
TextEditingController codeRPConfirmPassword = TextEditingController();
TextEditingController codeRName = TextEditingController();
TextEditingController codeRFirstName = TextEditingController();
TextEditingController codeRLastName = TextEditingController();
TextEditingController codePNumber = TextEditingController();
TextEditingController codePNEmergency = TextEditingController();
TextEditingController codeFPE = TextEditingController();
TextEditingController codeFP = TextEditingController();
TextEditingController codeFP1 = TextEditingController();
TextEditingController codeOTPFP1 = TextEditingController();
TextEditingController codeOTPFP2 = TextEditingController();
TextEditingController codeOTPFP3 = TextEditingController();
TextEditingController codeOTPFP4 = TextEditingController();
TextEditingController codeOTP1 = TextEditingController();
TextEditingController codeOTP2 = TextEditingController();
TextEditingController codeOTP3 = TextEditingController();
TextEditingController codeOTP4 = TextEditingController();
TextEditingController textFieldController = TextEditingController();
TextEditingController codeOldPass = TextEditingController();
TextEditingController codeNewPass = TextEditingController();
TextEditingController codeRePass = TextEditingController();
TextEditingController codeIdPlayer = TextEditingController();
TextEditingController codeIdCoreaPlayer = TextEditingController();
TextEditingController codeEmailPlayer = TextEditingController();
TextEditingController codePassPlayer = TextEditingController();
DateTime? selectedDate; // Variable to store selected date
String? selectedPosition; // Variable to store selected position
int? selectedGender; // Variable to store selected gender