// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:spchallange/l10n/messages_all.dart';

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Get a Quote`
  String get getaquote {
    return Intl.message(
      'GetaQuote',
      name: 'getaquote',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutus {
    return Intl.message(
      'AboutUs',
      name: 'aboutus',
      desc: '',
      args: [],
    );
  }

  /// `Log In`
  String get login {
    return Intl.message(
      'LogIn',
      name: 'login',
      desc: '',
      args: [],
    );
  }

  /// `Feedback`
  String get feedback {
    return Intl.message(
      'Feedback',
      name: 'feedback',
      desc: '',
      args: [],
    );
  }

  /// `Follow Us`
  String get FollowUs {
    return Intl.message(
      'FollowUs',
      name: 'FollowUs',
      desc: '',
      args: [],
    );
  }

  /// `Logout`
  String get Logout {
    return Intl.message(
      'Logout',
      name: 'Logout',
      desc: '',
      args: [],
    );
  }

  /// `Track Claim`
  String get trackclaim {
    return Intl.message(
      'TrackClaim',
      name: 'trackclaim',
      desc: '',
      args: [],
    );
  }

  /// `How To File A Claim`
  String get howToFileAClaim {
    return Intl.message(
      'howToFileAClaim',
      name: 'howtoFileAClaim',
      desc: '',
      args: [],
    );
  }

  /// `Personal Services`
  String get personalServices {
    return Intl.message(
      'personalServices',
      name: 'personalServices',
      desc: '',
      args: [],
    );
  }

  /// `Medical Network`
  String get medicalnetwork {
    return Intl.message(
      'Medical Network',
      name: 'medicalnetwork',
      desc: '',
      args: [],
    );
  }

  /// `Profile`
  String get profile {
    return Intl.message(
      'Profile',
      name: 'profile',
      desc: '',
      args: [],
    );
  }

  /// `Your feedbacck is important`
  String get yourfeedbackisimportant {
    return Intl.message(
      'Your feedbacck is important',
      name: 'yourfeedbackisimportant',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Guest`
  String get welcomeguest {
    return Intl.message(
      'Welcome Guest',
      name: 'welcomeguest',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get createaccount {
    return Intl.message(
      'Create Account',
      name: 'createaccount',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Contact Us`
  String get contactus {
    return Intl.message(
      'Contact Us',
      name: 'contactus',
      desc: '',
      args: [],
    );
  }

  /// `Regional Offices`
  String get regionaloffices {
    return Intl.message(
      'Regional Offices',
      name: 'regionaloffices',
      desc: '',
      args: [],
    );
  }

  /// `Social Media`
  String get socialmedia {
    return Intl.message(
      'Social Media',
      name: 'socialmedia',
      desc: '',
      args: [],
    );
  }

  /// `© ASIC, All Rights Reserved`
  String get allrightsreserved {
    return Intl.message(
      '© ASIC, All Rights Reserved',
      name: 'allrightsreserved',
      desc: '',
      args: [],
    );
  }

  /// `Welcome Back,`
  String get welcomeback {
    return Intl.message(
      'Welcome Back,',
      name: 'welcomeback',
      desc: '',
      args: [],
    );
  }

  /// `Virtual Medical Card`
  String get virtualmedicalcard {
    return Intl.message(
      'Virtual Medical Card',
      name: 'virtualmedicalcard',
      desc: '',
      args: [],
    );
  }

  /// `Members Virtual Card`
  String get membersvirtualcard {
    return Intl.message(
      'Members Virtual Card',
      name: 'membersvirtualcard',
      desc: '',
      args: [],
    );
  }

  /// `Policies List`
  String get policieslist {
    return Intl.message(
      'Policies List',
      name: 'policieslist',
      desc: '',
      args: [],
    );
  }

  /// `About Us`
  String get aboutUs {
    return Intl.message(
      'About Us',
      name: 'aboutUs',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield began operations in 1998 when the company,\bat that time incorporated as a Bahraini Company,\bwas represented in Saudi Arabia by an agent.`
  String get ASICIntro {
    return Intl.message(
      'Arabian Shield began operations in 1998 when the company,\bat that time incorporated as a Bahraini Company,\bwas represented in Saudi Arabia by an agent.',
      name: 'ASICIntro',
      desc: '',
      args: [],
    );
  }

  /// `Application  was made to incorporate a Saudi cooperative\binsurance company following the  licensing and regulation \bof the insurance industry in Saudi Arabia.`
  String get ASICApplication {
    return Intl.message(
      'Application  was made to incorporate a Saudi cooperative\binsurance company following the  licensing and regulation \bof the insurance industry in Saudi Arabia.',
      name: 'ASICApplication',
      desc: '',
      args: [],
    );
  }

  /// `Arabian  Shield Cooperative Insurance Company was incorporated \bin May 2007 as a Saudi  Joint Stock Company and was granted \ba license from SAMA in September 2007 to  transact general \band medical insurance business in Saudi Arabia. \bThe business  previously underwritten by the Bahraini \bcompany was transferred to Arabian  \bShield Cooperative Insurance Company \bwhich commenced operations on 1 January  2009.`
  String get ASICIncorporated {
    return Intl.message(
      'Arabian  Shield Cooperative Insurance Company was incorporated \bin May 2007 as a Saudi  Joint Stock Company and was granted \ba license from SAMA in September 2007 to  transact general \band medical insurance business in Saudi Arabia. \bThe business  previously underwritten by the Bahraini \bcompany was transferred to Arabian  \bShield Cooperative Insurance Company \bwhich commenced operations on 1 January  2009.',
      name: 'ASICIncorporated',
      desc: '',
      args: [],
    );
  }

  /// `Your feedback is important`
  String get feedBackTitle {
    return Intl.message(
      'Your feedback is important',
      name: 'feedBackTitle',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Mobile`
  String get mobile {
    return Intl.message(
      'Mobile',
      name: 'mobile',
      desc: '',
      args: [],
    );
  }

  /// `Please enter your mobile number.`
  String get pleaseEnterMobile {
    return Intl.message(
      'Please enter your mobile number.',
      name: 'pleaseEnterMobile',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number should be 10 digits & start with 05.`
  String get mobileValidation {
    return Intl.message(
      'Mobile number should be 10 digits & start with 05.',
      name: 'mobileValidation',
      desc: '',
      args: [],
    );
  }

  /// `How do you rate our app?`
  String get howDoYouRateApp {
    return Intl.message(
      'How do you rate our app?',
      name: 'howDoYouRateApp',
      desc: '',
      args: [],
    );
  }

  /// `Are you satisfied with our services?`
  String get areyousatisfiedwithourservices {
    return Intl.message(
      'Are you satisfied with our services?',
      name: 'areyousatisfiedwithourservices',
      desc: '',
      args: [],
    );
  }

  /// `Any suggestions to improve our services or app?`
  String get Anysuggestionstoimproveourservicesorapp {
    return Intl.message(
      'Any suggestions to improve our services or app?',
      name: 'Anysuggestionstoimproveourservicesorapp',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message(
      'yes',
      name: 'yes',
      desc: '',
      args: [],
    );
  }

  /// `no`
  String get no {
    return Intl.message(
      'no',
      name: 'no',
      desc: '',
      args: [],
    );
  }

  /// `Done`
  String get done {
    return Intl.message(
      'Done',
      name: 'done',
      desc: '',
      args: [],
    );
  }

  /// `Email was sent.`
  String get EmailWasSent {
    return Intl.message(
      'Email was sent.',
      name: 'EmailWasSent',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get close {
    return Intl.message(
      'Close',
      name: 'close',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send email`
  String get failedtosendemail {
    return Intl.message(
      'Failed to send email',
      name: 'failedtosendemail',
      desc: '',
      args: [],
    );
  }

  /// `Please check all fields.`
  String get Pleasecheckallfields {
    return Intl.message(
      'Please check all fields.',
      name: 'Pleasecheckallfields',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Submit {
    return Intl.message(
      'Submit',
      name: 'Submit',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get Send {
    return Intl.message(
      'Send',
      name: 'Send',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there was an error loading your data`
  String get errorwhileloadingdate {
    return Intl.message(
      'Sorry, there was an error loading your data',
      name: 'errorwhileloadingdate',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately, you either have no medical policy issued or active at the moment.`
  String get nomedicalpolicyerror {
    return Intl.message(
      'Unfortunately, you either have no medical policy issued or active at the moment.',
      name: 'nomedicalpolicyerror',
      desc: '',
      args: [],
    );
  }

  /// `Members Virtual Card`
  String get memberVirtualCard {
    return Intl.message(
      'Members Virtual Card',
      name: 'memberVirtualCard',
      desc: '',
      args: [],
    );
  }

  /// `Policies*`
  String get Policies {
    return Intl.message(
      'Policies',
      name: 'Policies',
      desc: '',
      args: [],
    );
  }

  /// `Claims`
  String get claims {
    return Intl.message(
      'Claims',
      name: 'claims',
      desc: '',
      args: [],
    );
  }

  /// `Statement\nOf Account`
  String get SOA {
    return Intl.message(
      'Statement\nOf Account',
      name: 'SOA',
      desc: '',
      args: [],
    );
  }

  /// `Personal Services`
  String get personalServicesHeader {
    return Intl.message(
      'Personal Services',
      name: 'personalServicesHeader',
      desc: '',
      args: [],
    );
  }

  /// `Member Name`
  String get MemberName {
    return Intl.message(
      'Member Name',
      name: 'MemberName',
      desc: '',
      args: [],
    );
  }

  /// `Select`
  String get select {
    return Intl.message(
      'Select',
      name: 'select',
      desc: '',
      args: [],
    );
  }

  /// `Please Fill all fields.`
  String get PleaseFillallfields {
    return Intl.message(
      'Please Fill all fields.',
      name: 'PleaseFillallfields',
      desc: '',
      args: [],
    );
  }

  /// `Go To Card`
  String get goToCard {
    return Intl.message(
      'Go To Card',
      name: 'goToCard',
      desc: '',
      args: [],
    );
  }

  /// `Medical Card`
  String get MedicalCard {
    return Intl.message(
      'Medical Card',
      name: 'MedicalCard',
      desc: '',
      args: [],
    );
  }

  /// `Policy Holder Name`
  String get PolicyHolderName {
    return Intl.message(
      'Policy Holder Name',
      name: 'PolicyHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Card No.:`
  String get CardNo {
    return Intl.message(
      'Card No.:',
      name: 'CardNo',
      desc: '',
      args: [],
    );
  }

  /// `National ID`
  String get NationalId {
    return Intl.message(
      'National ID',
      name: 'NationalId',
      desc: '',
      args: [],
    );
  }

  /// `Class`
  String get Class {
    return Intl.message(
      'Class',
      name: 'Class',
      desc: '',
      args: [],
    );
  }

  /// `Plan`
  String get Plan {
    return Intl.message(
      'Plan',
      name: 'Plan',
      desc: '',
      args: [],
    );
  }

  /// `Area of \n Cover`
  String get AreaOfCover {
    return Intl.message(
      'Area of \n Cover',
      name: 'AreaOfCover',
      desc: '',
      args: [],
    );
  }

  /// `Network`
  String get Network {
    return Intl.message(
      'Network',
      name: 'Network',
      desc: '',
      args: [],
    );
  }

  /// `Date of Birth`
  String get DOB {
    return Intl.message(
      'Date of Birth',
      name: 'DOB',
      desc: '',
      args: [],
    );
  }

  /// `Effective Date`
  String get EffectiveDate {
    return Intl.message(
      'Effective Date',
      name: 'EffectiveDate',
      desc: '',
      args: [],
    );
  }

  /// `Expiry Date`
  String get ExpiryDate {
    return Intl.message(
      'Expiry Date',
      name: 'ExpiryDate',
      desc: '',
      args: [],
    );
  }

  /// `Emp. No`
  String get EmpNo {
    return Intl.message(
      'Emp. No',
      name: 'EmpNo',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message(
      'Edit',
      name: 'edit',
      desc: '',
      args: [],
    );
  }

  /// `Nationality`
  String get Nationality {
    return Intl.message(
      'Nationality',
      name: 'Nationality',
      desc: '',
      args: [],
    );
  }

  /// `Change Password`
  String get ChangePassword {
    return Intl.message(
      'Change Password',
      name: 'ChangePassword',
      desc: '',
      args: [],
    );
  }

  /// `Old Password`
  String get OldPassword {
    return Intl.message(
      'Old Password',
      name: 'OldPassword',
      desc: '',
      args: [],
    );
  }

  /// `New Password`
  String get NewPassword {
    return Intl.message(
      'New Password',
      name: 'NewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Re-Enter New Password`
  String get ReEnterNewPassword {
    return Intl.message(
      'Re-Enter New Password',
      name: 'ReEnterNewPassword',
      desc: '',
      args: [],
    );
  }

  /// `Success`
  String get Success {
    return Intl.message(
      'Success',
      name: 'Success',
      desc: '',
      args: [],
    );
  }

  /// `Password Changed Successfully`
  String get PasswordChangedSuccessfully {
    return Intl.message(
      'Password Changed Successfully',
      name: 'PasswordChangedSuccessfully',
      desc: '',
      args: [],
    );
  }

  /// `Save`
  String get Save {
    return Intl.message(
      'Save',
      name: 'Save',
      desc: '',
      args: [],
    );
  }

  /// `Please Check fields again`
  String get PleaseCheckfieldsagain {
    return Intl.message(
      'Please Check fields again',
      name: 'PleaseCheckfieldsagain',
      desc: '',
      args: [],
    );
  }

  /// `Photo Library`
  String get PhotoLibrary {
    return Intl.message(
      'Photo Library',
      name: 'PhotoLibrary',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get Camera {
    return Intl.message(
      'Camera',
      name: 'Camera',
      desc: '',
      args: [],
    );
  }

  /// `Full Name`
  String get FullName {
    return Intl.message(
      'Full Name',
      name: 'FullName',
      desc: '',
      args: [],
    );
  }

  /// `Your profile has been updated`
  String get Yourprofilehasbeenupdated {
    return Intl.message(
      'Your profile has been updated',
      name: 'Yourprofilehasbeenupdated',
      desc: '',
      args: [],
    );
  }

  /// `Ok`
  String get ok {
    return Intl.message(
      'Ok',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong`
  String get Somethingwentwrong {
    return Intl.message(
      'Something went wrong',
      name: 'Somethingwentwrong',
      desc: '',
      args: [],
    );
  }

  /// `Validation`
  String get Validation {
    return Intl.message(
      'Validation',
      name: 'Validation',
      desc: '',
      args: [],
    );
  }

  /// `No Data`
  String get nodata {
    return Intl.message(
      'No Data',
      name: 'nodata',
      desc: '',
      args: [],
    );
  }

  /// `Edit Profile`
  String get EditProfile {
    return Intl.message(
      'Edit Profile',
      name: 'EditProfile',
      desc: '',
      args: [],
    );
  }

  /// `Saudi`
  String get Saudi {
    return Intl.message(
      'Saudi',
      name: 'Saudi',
      desc: '',
      args: [],
    );
  }

  /// `Non-Saudi`
  String get NonSaudi {
    return Intl.message(
      'Non-Saudi',
      name: 'NonSaudi',
      desc: '',
      args: [],
    );
  }

  /// `ID Expiry Date (Hijri)`
  String get IDExpiryDateHijri {
    return Intl.message(
      'ID Expiry Date (Hijri)',
      name: 'IDExpiryDateHijri',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get Password {
    return Intl.message(
      'Password',
      name: 'Password',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password`
  String get ConfirmPassword {
    return Intl.message(
      'Confirm Password',
      name: 'ConfirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Thank you for registering, press Ok to sign in`
  String get ThankyouforregisteringpressOktosignin {
    return Intl.message(
      'Thank you for registering, press Ok to sign in',
      name: 'ThankyouforregisteringpressOktosignin',
      desc: '',
      args: [],
    );
  }

  /// `Sorry, there was an error loading your data`
  String get Sorrytherewasanerrorloadingyourdata {
    return Intl.message(
      'Sorry, there was an error loading your data',
      name: 'Sorrytherewasanerrorloadingyourdata',
      desc: '',
      args: [],
    );
  }

  /// `Your Information`
  String get YourInformation {
    return Intl.message(
      'Your Information',
      name: 'YourInformation',
      desc: '',
      args: [],
    );
  }

  /// `Commercial No`
  String get CommercialNo {
    return Intl.message(
      'Commercial No',
      name: 'CommercialNo',
      desc: '',
      args: [],
    );
  }

  /// `Title`
  String get Title {
    return Intl.message(
      'Title',
      name: 'Title',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get Name {
    return Intl.message(
      'Name',
      name: 'Name',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get FirstName {
    return Intl.message(
      'First Name',
      name: 'FirstName',
      desc: '',
      args: [],
    );
  }

  /// `Middle Name`
  String get MiddleName {
    return Intl.message(
      'Middle Name',
      name: 'MiddleName',
      desc: '',
      args: [],
    );
  }

  /// `Last Name`
  String get LastName {
    return Intl.message(
      'Last Name',
      name: 'LastName',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get Gender {
    return Intl.message(
      'Gender',
      name: 'Gender',
      desc: '',
      args: [],
    );
  }

  /// `Job Title`
  String get JobTitle {
    return Intl.message(
      'Job Title',
      name: 'JobTitle',
      desc: '',
      args: [],
    );
  }

  /// `Nature of Business`
  String get NatureofBusiness {
    return Intl.message(
      'Nature of Business',
      name: 'NatureofBusiness',
      desc: '',
      args: [],
    );
  }

  /// ` We have sent an email for you with the username and password in order to login.`
  String get Wehavesentanemailforyouwiththeusernameandpasswordinordertologin {
    return Intl.message(
      ' We have sent an email for you with the username and password in order to login.',
      name: 'Wehavesentanemailforyouwiththeusernameandpasswordinordertologin',
      desc: '',
      args: [],
    );
  }

  /// `General`
  String get General {
    return Intl.message(
      'General',
      name: 'General',
      desc: '',
      args: [],
    );
  }

  /// `Travel`
  String get Travel {
    return Intl.message(
      'Travel',
      name: 'Travel',
      desc: '',
      args: [],
    );
  }

  /// `Unfortunately, no policies were found under your account/registered ID.`
  String get NoPoliciesMessage {
    return Intl.message(
      'Unfortunately, no policies were found under your account/registered ID.',
      name: 'NoPoliciesMessage',
      desc: '',
      args: [],
    );
  }

  /// `Gnereal Policy`
  String get GnerealPolicy {
    return Intl.message(
      'Gnereal Policy',
      name: 'GnerealPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Product Name`
  String get ProductName {
    return Intl.message(
      'Product Name',
      name: 'ProductName',
      desc: '',
      args: [],
    );
  }

  /// `Policy No.`
  String get PolicyNo {
    return Intl.message(
      'Policy No.',
      name: 'PolicyNo',
      desc: '',
      args: [],
    );
  }

  /// `Plate No.`
  String get PlatNo {
    return Intl.message(
      'Plate No.',
      name: 'PlatNo',
      desc: '',
      args: [],
    );
  }

  /// `Can't print report for this policy type`
  String get cantprintforpolicy {
    return Intl.message(
      'Can\'t print report for this policy type',
      name: 'cantprintforpolicy',
      desc: '',
      args: [],
    );
  }

  /// `Print Policy`
  String get PrintPolicy {
    return Intl.message(
      'Print Policy',
      name: 'PrintPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Individual`
  String get Individual {
    return Intl.message(
      'Individual',
      name: 'Individual',
      desc: '',
      args: [],
    );
  }

  /// `Corporate`
  String get Corporate {
    return Intl.message(
      'Corporate',
      name: 'Corporate',
      desc: '',
      args: [],
    );
  }

  /// `CR No.`
  String get CR {
    return Intl.message(
      'CR',
      name: 'CR',
      desc: '',
      args: [],
    );
  }

  /// `Full Name Must Contain AtLeast Two Parts`
  String get FullNameMustContainAtLeastThreeParts {
    return Intl.message(
      'FullNameMustContainAtLeastThreeParts',
      name: 'FullNameMustContainAtLeastThreeParts',
      desc: '',
      args: [],
    );
  }

  /// `Choose Date`
  String get ChooseDate {
    return Intl.message(
      'ChooseDate',
      name: 'ChooseDate',
      desc: '',
      args: [],
    );
  }

  /// `Renew Policy`
  String get RenewPolicy {
    return Intl.message(
      'Renew Policy',
      name: 'RenewPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Travel Policy`
  String get TravelPolicy {
    return Intl.message(
      'Travel Policy',
      name: 'TravelPolicy',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get travelinsurance {
    return Intl.message(
      'Travel Insurance',
      name: 'travelinsurance',
      desc: '',
      args: [],
    );
  }

  /// `Head Office`
  String get headOffice {
    return Intl.message(
      'Head Office',
      name: 'headOffice',
      desc: '',
      args: [],
    );
  }

  /// `Eastern Regional Office`
  String get easternRegionalOffice {
    return Intl.message(
      'Eastern Regional Office',
      name: 'easternRegionalOffice',
      desc: '',
      args: [],
    );
  }

  /// `Jeddah Regional Office`
  String get jeddahRegionalOffice {
    return Intl.message(
      'Jeddah Regional Office',
      name: 'jeddahRegionalOffice',
      desc: '',
      args: [],
    );
  }

  /// `3rd Floor Suite Nos.301 & 302 Blue Tower, King Faisal Road Yarmourk District, P.O. Box 2399, Al-Khobar 31952`
  String get rdFloorSuiteKingFaisalRoadYarmourkDistrictAlKhobar {
    return Intl.message(
      '3rd Floor Suite Nos.301 & 302 Blue Tower, King Faisal Road Yarmourk District, P.O. Box 2399, Al-Khobar 31952',
      name: 'rdFloorSuiteKingFaisalRoadYarmourkDistrictAlKhobar',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number: 38062300`
  String get PhoneNumber38062300 {
    return Intl.message(
      'Phone Number: 38062300',
      name: 'PhoneNumber38062300',
      desc: '',
      args: [],
    );
  }

  /// `Fax Number: 38062399`
  String get FaxNumber38062399 {
    return Intl.message(
      'Fax Number: 38062399',
      name: 'FaxNumber38062399',
      desc: '',
      args: [],
    );
  }

  /// `P.O. Box 24431 Jeddah 21446`
  String get POBox24431Jeddah21446 {
    return Intl.message(
      'P.O. Box 24431 Jeddah 21446',
      name: 'POBox24431Jeddah21446',
      desc: '',
      args: [],
    );
  }

  /// `Kingdom of Saudi Arabia`
  String get KingdomofSaudiArabia {
    return Intl.message(
      'Kingdom of Saudi Arabia',
      name: 'KingdomofSaudiArabia',
      desc: '',
      args: [],
    );
  }

  /// `Phone: +966 (02) 614 0293`
  String get Phone966026140293 {
    return Intl.message(
      'Phone: +966 (02) 614 0293',
      name: 'Phone966026140293',
      desc: '',
      args: [],
    );
  }

  /// `Fax: +966 (02) 614 0290`
  String get Fax966026140290 {
    return Intl.message(
      'Fax: +966 (02) 614 0290',
      name: 'Fax966026140290',
      desc: '',
      args: [],
    );
  }

  /// `Contact Details`
  String get ContactDetails {
    return Intl.message(
      'Contact Details',
      name: 'ContactDetails',
      desc: '',
      args: [],
    );
  }

  /// `City`
  String get City {
    return Intl.message(
      'City',
      name: 'City',
      desc: '',
      args: [],
    );
  }

  /// `Provider Type`
  String get ProviderType {
    return Intl.message(
      'Provider Type',
      name: 'ProviderType',
      desc: '',
      args: [],
    );
  }

  /// `Specialty`
  String get Specialty {
    return Intl.message(
      'Specialty',
      name: 'Specialty',
      desc: '',
      args: [],
    );
  }

  /// `Provider Name`
  String get ProviderName {
    return Intl.message(
      'Provider Name',
      name: 'ProviderName',
      desc: '',
      args: [],
    );
  }

  /// `Find Nearest`
  String get FindNearest {
    return Intl.message(
      'Find Nearest',
      name: 'FindNearest',
      desc: '',
      args: [],
    );
  }

  /// `Please fill fields correctly.`
  String get Pleasefillfieldscorrectly {
    return Intl.message(
      'Please fill fields correctly.',
      name: 'Pleasefillfieldscorrectly',
      desc: '',
      args: [],
    );
  }

  /// `Close`
  String get Close {
    return Intl.message(
      'Close',
      name: 'Close',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get Search {
    return Intl.message(
      'Search',
      name: 'Search',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get Reset {
    return Intl.message(
      'Reset',
      name: 'Reset',
      desc: '',
      args: [],
    );
  }

  /// `Losses related to traffic accidents as replacing damaged vehicles costs, repair costs, remedial costs or any other expenses related to responsibilities against third parties represent a big burden on the owner of the vehicle or its driver. Arabian Shield is looking to meet customers’ expectations and provide protection through its Motor Insurance Programs.`
  String get mainTextMotorInsurance {
    return Intl.message(
      'Losses related to traffic accidents as replacing damaged vehicles costs, repair costs, remedial costs or any other expenses related to responsibilities against third parties represent a big burden on the owner of the vehicle or its driver. Arabian Shield is looking to meet customers’ expectations and provide protection through its Motor Insurance Programs.',
      name: 'mainTextMotorInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive Insurance Compulsory Motor Insurance (Third Party)`
  String get TitlesMotorInsurance {
    return Intl.message(
      'Comprehensive Insurance Compulsory Motor Insurance (Third Party)',
      name: 'TitlesMotorInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive Insurance Program from Arabian Shield has many advantages that provide peace of mind and confidence and this is what distinguished our program from other insurance companies, these advantages include:`
  String get Paragraphs1 {
    return Intl.message(
      'Comprehensive Insurance Program from Arabian Shield has many advantages that provide peace of mind and confidence and this is what distinguished our program from other insurance companies, these advantages include:',
      name: 'Paragraphs1',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield pays liability compensation through this program that may be consequent on the vehicle owner or the driver to compensate a third party as a result of an accident caused by the insured vehicle. This program has unique advantages, including: `
  String get Paragraphs2 {
    return Intl.message(
      'Arabian Shield pays liability compensation through this program that may be consequent on the vehicle owner or the driver to compensate a third party as a result of an accident caused by the insured vehicle. This program has unique advantages, including: ',
      name: 'Paragraphs2',
      desc: '',
      args: [],
    );
  }

  /// `Cover all the losses and damages to the insured vehicle as a result of a traffic accident.`
  String get firstPoints1 {
    return Intl.message(
      'Cover all the losses and damages to the insured vehicle as a result of a traffic accident.',
      name: 'firstPoints1',
      desc: '',
      args: [],
    );
  }

  /// `Compensate for the losses related to natural disasters such as hail and floods.`
  String get firstPoints2 {
    return Intl.message(
      'Compensate for the losses related to natural disasters such as hail and floods.',
      name: 'firstPoints2',
      desc: '',
      args: [],
    );
  }

  /// `Compensate for cases of theft.`
  String get firstPoints3 {
    return Intl.message(
      'Compensate for cases of theft.',
      name: 'firstPoints3',
      desc: '',
      args: [],
    );
  }

  /// `A choice between the vast network of certified workshops or agency for repairs.`
  String get firstPoints4 {
    return Intl.message(
      'A choice between the vast network of certified workshops or agency for repairs.',
      name: 'firstPoints4',
      desc: '',
      args: [],
    );
  }

  /// `Insured gets an insurance card preventing him from being held by traffic department.`
  String get secondPoints1 {
    return Intl.message(
      'Insured gets an insurance card preventing him from being held by traffic department.',
      name: 'secondPoints1',
      desc: '',
      args: [],
    );
  }

  /// `Insurance Coverage for all types of vehicles.`
  String get secondPoints2 {
    return Intl.message(
      'Insurance Coverage for all types of vehicles.',
      name: 'secondPoints2',
      desc: '',
      args: [],
    );
  }

  /// `Accidents are many, they cause serious injuries sometimes may lead to disability or death. The personal accident insurance is a policy that provides you with the compensation you are looking for when an unexpected accident occurs. Where the compensation will be paid by Arabian Shield in case of death of the insured or serious injury because of an accident caused by external, violent and visible means led to disability/inability.`
  String get mainTextPersonalAccident {
    return Intl.message(
      'Accidents are many, they cause serious injuries sometimes may lead to disability or death. The personal accident insurance is a policy that provides you with the compensation you are looking for when an unexpected accident occurs. Where the compensation will be paid by Arabian Shield in case of death of the insured or serious injury because of an accident caused by external, violent and visible means led to disability/inability.',
      name: 'mainTextPersonalAccident',
      desc: '',
      args: [],
    );
  }

  /// `Program Unique Features:`
  String get Titles1 {
    return Intl.message(
      'Program Unique Features:',
      name: 'Titles1',
      desc: '',
      args: [],
    );
  }

  /// `Coverage:`
  String get Titles2 {
    return Intl.message(
      'Coverage:',
      name: 'Titles2',
      desc: '',
      args: [],
    );
  }

  /// `Personal accident insurance covers directly and independently any reasons for the loss resulting from physical injuries caused by an accident at work or outside , anywhere in the world while the compensated amount depends on the insured usually wages / salaries earned.`
  String get ParagraphsPersonalAccident {
    return Intl.message(
      'Personal accident insurance covers directly and independently any reasons for the loss resulting from physical injuries caused by an accident at work or outside , anywhere in the world while the compensated amount depends on the insured usually wages / salaries earned.',
      name: 'ParagraphsPersonalAccident',
      desc: '',
      args: [],
    );
  }

  /// `Death.`
  String get secondPointsPersonalAccident1 {
    return Intl.message(
      'Death.',
      name: 'secondPointsPersonalAccident1',
      desc: '',
      args: [],
    );
  }

  /// `Permanent disability.`
  String get secondPointsPersonalAccident2 {
    return Intl.message(
      'Permanent disability.',
      name: 'secondPointsPersonalAccident2',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield will indemnify the insured in the events of losing luggage, Temporary total disability.`
  String get secondPointsPersonalAccident3 {
    return Intl.message(
      'Arabian Shield will indemnify the insured in the events of losing luggage, Temporary total disability.',
      name: 'secondPointsPersonalAccident3',
      desc: '',
      args: [],
    );
  }

  /// `Whether for business or entertainment..... There are many urgent matters that may take place and you cannot avoid them, they may make your travel abroad less fun or make you vulnerable to delay important business.Now with Arabian Shield you can enjoy a safer journey by getting out travel insurance to European countries or worldwide.`
  String get mainTextTravelnsurance {
    return Intl.message(
      'Whether for business or entertainment..... There are many urgent matters that may take place and you cannot avoid them, they may make your travel abroad less fun or make you vulnerable to delay important business.Now with Arabian Shield you can enjoy a safer journey by getting out travel insurance to European countries or worldwide.',
      name: 'mainTextTravelnsurance',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield has signed an agreement with International SOS the world leader in the provision of:`
  String get ParagraphstravelInsurance1 {
    return Intl.message(
      'Arabian Shield has signed an agreement with International SOS the world leader in the provision of:',
      name: 'ParagraphstravelInsurance1',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield travel insurance policy provides you with the following core services:`
  String get ParagraphstravelInsurance2 {
    return Intl.message(
      'Arabian Shield travel insurance policy provides you with the following core services:',
      name: 'ParagraphstravelInsurance2',
      desc: '',
      args: [],
    );
  }

  /// `Medical assistance.`
  String get firstPointstravelInsurance1 {
    return Intl.message(
      'Medical assistance.',
      name: 'firstPointstravelInsurance1',
      desc: '',
      args: [],
    );
  }

  /// `International health care.`
  String get firstPointstravelInsurance2 {
    return Intl.message(
      'International health care.',
      name: 'firstPointstravelInsurance2',
      desc: '',
      args: [],
    );
  }

  /// `Benefits and medical expenses.`
  String get secondPointstravelInsurance1 {
    return Intl.message(
      'Benefits and medical expenses.',
      name: 'secondPointstravelInsurance1',
      desc: '',
      args: [],
    );
  }

  /// `Free medical assistance.`
  String get secondPointstravelInsurance2 {
    return Intl.message(
      'Free medical assistance.',
      name: 'secondPointstravelInsurance2',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield will indemnify the insured in the events of losing luggage, flight cancellation or missing the flight due to a non-deliberate medical emergency.`
  String get secondPointstravelInsurance3 {
    return Intl.message(
      'Arabian Shield will indemnify the insured in the events of losing luggage, flight cancellation or missing the flight due to a non-deliberate medical emergency.',
      name: 'secondPointstravelInsurance3',
      desc: '',
      args: [],
    );
  }

  /// `Your loved ones are our loved ones. We do care about their comfort during their visit to Saudi Arabia. Now you can easily extend your loved ones visit visa insurance by filling some fields below.`
  String get mainTextVisitVisa {
    return Intl.message(
      'Your loved ones are our loved ones. We do care about their comfort during their visit to Saudi Arabia. Now you can easily extend your loved ones visit visa insurance by filling some fields below.',
      name: 'mainTextVisitVisa',
      desc: '',
      args: [],
    );
  }

  /// `Medical Malpractice Insurance`
  String get TitlesMedicalMalpractice1 {
    return Intl.message(
      'Medical Malpractice Insurance',
      name: 'TitlesMedicalMalpractice1',
      desc: '',
      args: [],
    );
  }

  /// `What is the insurance coverage?`
  String get TitlesMedicalMalpractice2 {
    return Intl.message(
      'What is the insurance coverage?',
      name: 'TitlesMedicalMalpractice2',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield provides peace of mind for medical professionals in the event of being exposed to a claim or prosecution, as the company offers them the possible assistance and support to protect them and protect their professional reputation.`
  String get ParagraphsMedicalMalpractice1 {
    return Intl.message(
      'Arabian Shield provides peace of mind for medical professionals in the event of being exposed to a claim or prosecution, as the company offers them the possible assistance and support to protect them and protect their professional reputation.',
      name: 'ParagraphsMedicalMalpractice1',
      desc: '',
      args: [],
    );
  }

  /// `The company protects medical professionals against legal liability in the event of any breach of their duties through the exercise of their professional work. Whether the violation by fault, negligence or omission. This insurance coverage includes:`
  String get ParagraphsMedicalMalpractice2 {
    return Intl.message(
      'The company protects medical professionals against legal liability in the event of any breach of their duties through the exercise of their professional work. Whether the violation by fault, negligence or omission. This insurance coverage includes:',
      name: 'ParagraphsMedicalMalpractice2',
      desc: '',
      args: [],
    );
  }

  /// `Settlements`
  String get secondPointsMedicalMalpractice1 {
    return Intl.message(
      'Settlements',
      name: 'secondPointsMedicalMalpractice1',
      desc: '',
      args: [],
    );
  }

  /// `Compensatory damages adjudged against medical professionals`
  String get secondPointsMedicalMalpractice2 {
    return Intl.message(
      'Compensatory damages adjudged against medical professionals',
      name: 'secondPointsMedicalMalpractice2',
      desc: '',
      args: [],
    );
  }

  /// `Judicial costs and expenses incurred in connection with the defense of judicial proceedings.`
  String get secondPointsMedicalMalpractice3 {
    return Intl.message(
      'Judicial costs and expenses incurred in connection with the defense of judicial proceedings.',
      name: 'secondPointsMedicalMalpractice3',
      desc: '',
      args: [],
    );
  }

  /// `Reassurance on human and family health works as a stimulus for everyone to do more tender. Arabian Shield seeks to provide a healthy environment and guarantees the right of insured to receive full treatment and health care he needs through a wide and distinctive network of hospitals.`
  String get mainTextMedicalInsurance {
    return Intl.message(
      'Reassurance on human and family health works as a stimulus for everyone to do more tender. Arabian Shield seeks to provide a healthy environment and guarantees the right of insured to receive full treatment and health care he needs through a wide and distinctive network of hospitals.',
      name: 'mainTextMedicalInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a correct Email address`
  String get pleaseEnterCorrectEmail {
    return Intl.message(
      'Please enter a correct Email address',
      name: 'pleaseEnterCorrectEmail',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a correct Password`
  String get pleaseEntercorrectPass {
    return Intl.message(
      'Please enter a correct Password',
      name: 'pleaseEntercorrectPass',
      desc: '',
      args: [],
    );
  }

  /// `We see you are having trouble logging into the app. Please make sure you have the correct email address and password. If you have forgotten your password you can request a new one  by clicking the 'Forgot Password' button.`
  String get clickingForgotPassword {
    return Intl.message(
      'We see you are having trouble logging into the app. Please make sure you have the correct email address and password. If you have forgotten your password you can request a new one  by clicking the \'Forgot Password\' button.',
      name: 'clickingForgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please fill fields correctly.`
  String get pleaseFillFields {
    return Intl.message(
      'Please fill fields correctly.',
      name: 'pleaseFillFields',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgotPass {
    return Intl.message(
      'Forgot password?',
      name: 'forgotPass',
      desc: '',
      args: [],
    );
  }

  /// `insurancesPrices`
  String get insurancesPrices {
    return Intl.message(
      'Insurances Prices',
      name: 'insurancesPrices',
      desc: '',
      args: [],
    );
  }

  /// `MotorRenwal`
  String get motorrenewal {
    return Intl.message(
      'motorrenewal',
      name: 'motorrenewal',
      desc: '',
      args: [],
    );
  }

  /// `WhatsAppisnotinstalled`
  String get whatsAppisnotinstalled {
    return Intl.message(
      'whatsAppisnotinstalled',
      name: 'whatsAppisnotinstalled',
      desc: '',
      args: [],
    );
  }

  /// `OurBranches`
  String get ourBranches {
    return Intl.message(
      'OurBranches',
      name: 'ourBranches',
      desc: '',
      args: [],
    );
  }

  /// `Registration`
  String get Registration {
    return Intl.message(
      'Registration',
      name: 'Registration',
      desc: '',
      args: [],
    );
  }

  /// `Something went wrong, please try again!`
  String get somethingwentWrongPleaseTryAgain {
    return Intl.message(
      'Something went wrong, please try again!',
      name: 'somethingwentWrongPleaseTryAgain',
      desc: '',
      args: [],
    );
  }

  /// `Claim NO.`
  String get ClaimNO {
    return Intl.message(
      'Claim NO.',
      name: 'ClaimNO',
      desc: '',
      args: [],
    );
  }

  /// `Policy NO.`
  String get policyNo {
    return Intl.message(
      'Policy NO.',
      name: 'policyNo',
      desc: '',
      args: [],
    );
  }

  /// `Plate NO.`
  String get plateNo {
    return Intl.message(
      'Plate NO.',
      name: 'plateNo',
      desc: '',
      args: [],
    );
  }

  /// `Policy Type`
  String get policyType {
    return Intl.message(
      'Policy Type',
      name: 'policyType',
      desc: '',
      args: [],
    );
  }

  /// `Claim Status`
  String get ClaimStatus {
    return Intl.message(
      'Claim Status',
      name: 'ClaimStatus',
      desc: '',
      args: [],
    );
  }

  /// `Submission Date`
  String get SubmissionDate {
    return Intl.message(
      'Submission Date',
      name: 'SubmissionDate',
      desc: '',
      args: [],
    );
  }

  /// `Claimed Amount`
  String get ClaimedAmount {
    return Intl.message(
      'Claimed Amount',
      name: 'ClaimedAmount',
      desc: '',
      args: [],
    );
  }

  /// `No claims were registered under any of your policies.`
  String get noClaimsregistered {
    return Intl.message(
      'No claims were registered under any of your policies.',
      name: 'noClaimsregistered',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance`
  String get medicalinsurance {
    return Intl.message(
      'Medical Insurance',
      name: 'medicalinsurance',
      desc: '',
      args: [],
    );
  }

  /// `Motor Insurance`
  String get motorinsurance {
    return Intl.message(
      'Motor Insurance',
      name: 'motorinsurance',
      desc: '',
      args: [],
    );
  }

  /// `Medical Malpractice`
  String get medicalmalpractice {
    return Intl.message(
      'Medical Malpractice',
      name: 'medicalmalpractice',
      desc: '',
      args: [],
    );
  }

  /// `Medical Malpractice`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident`
  String get personalaccident {
    return Intl.message(
      'Personal Accident',
      name: 'personalaccident',
      desc: '',
      args: [],
    );
  }

  /// `Visit Visa`
  String get visitvisa {
    return Intl.message(
      'Visit Visa',
      name: 'visitvisa',
      desc: '',
      args: [],
    );
  }

  /// `Comprehensive Insurance`
  String get comprehensiveinsurance {
    return Intl.message(
      'Comprehensive Insurance',
      name: 'comprehensiveinsurance',
      desc: '',
      args: [],
    );
  }

  /// `Third Party Insurance (TP)`
  String get compulsiveinsurance {
    return Intl.message(
      'Third Party Insurance (TP)',
      name: 'compulsiveinsurance',
      desc: '',
      args: [],
    );
  }

  /// `Facebook`
  String get facebook {
    return Intl.message(
      'Facebook',
      name: 'facebook',
      desc: '',
      args: [],
    );
  }

  /// `Twitter`
  String get twitter {
    return Intl.message(
      'Twitter',
      name: 'twitter',
      desc: '',
      args: [],
    );
  }

  /// `YouTube`
  String get youtube {
    return Intl.message(
      'YouTube',
      name: 'youtube',
      desc: '',
      args: [],
    );
  }

  /// `Google Plus`
  String get googleplus {
    return Intl.message(
      'Google Plus',
      name: 'googleplus',
      desc: '',
      args: [],
    );
  }

  /// `Alert`
  String get alert {
    return Intl.message(
      'Alert',
      name: 'alert',
      desc: '',
      args: [],
    );
  }

  /// `You will recieve an email shortly`
  String get recieveemail {
    return Intl.message(
      'You will recieve an email shortly',
      name: 'recieveemail',
      desc: '',
      args: [],
    );
  }

  /// `From Date`
  String get DateFrom {
    return Intl.message(
      'From Date',
      name: 'DateFrom',
      desc: '',
      args: [],
    );
  }

  /// `To Date`
  String get DateTo {
    return Intl.message(
      'To Date',
      name: 'DateTo',
      desc: '',
      args: [],
    );
  }

  /// `Currency`
  String get Currency {
    return Intl.message(
      'Currency',
      name: 'Currency',
      desc: '',
      args: [],
    );
  }

  /// ` Statement Type`
  String get StatementType {
    return Intl.message(
      ' Statement Type',
      name: 'StatementType',
      desc: '',
      args: [],
    );
  }

  /// `Transaction No.`
  String get TransactionNo {
    return Intl.message(
      'Transaction No.',
      name: 'TransactionNo',
      desc: '',
      args: [],
    );
  }

  /// `Transaction Date`
  String get TransactionDate {
    return Intl.message(
      'Transaction Date',
      name: 'TransactionDate',
      desc: '',
      args: [],
    );
  }

  /// `Debit`
  String get Debit {
    return Intl.message(
      'Debit',
      name: 'Debit',
      desc: '',
      args: [],
    );
  }

  /// `Credit`
  String get Credit {
    return Intl.message(
      'Credit',
      name: 'Credit',
      desc: '',
      args: [],
    );
  }

  /// `Balance`
  String get Balance {
    return Intl.message(
      'Balance',
      name: 'Balance',
      desc: '',
      args: [],
    );
  }

  /// `Retrieve Quotation`
  String get QuoteRetrieval {
    return Intl.message(
      'Quote Retrieval',
      name: 'QuoteRetrieval',
      desc: '',
      args: [],
    );
  }

  /// `Retrieve`
  String get Retrieve {
    return Intl.message(
      'Retrieve',
      name: 'Retrieve',
      desc: '',
      args: [],
    );
  }

  /// `Travel Insurance`
  String get travelInsuranceHeader {
    return Intl.message(
      'travelInsuranceHeader',
      name: 'travelInsuranceHeader',
      desc: '',
      args: [],
    );
  }

  /// `Phone Number`
  String get phone {
    return Intl.message(
      'phone',
      name: 'phone',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance`
  String get medicalInsuranceHeader {
    return Intl.message(
      'medicalInsuranceHeader',
      name: 'medicalInsuranceHeader',
      desc: '',
      args: [],
    );
  }

  /// `Retrieve Your Quote`
  String get RetrieveYourQuote {
    return Intl.message(
      'Retrieve Your Quote',
      name: 'RetrieveYourQuote',
      desc: '',
      args: [],
    );
  }

  /// `If you have previously registered a quote online through any of our digital channels (Mobile App. or Portal), you can get it back by filling in your Iqama/Saudi ID and either your Email or Quote No. generated back then.`
  String get Ifyouhavepreviouslyregisteredaquote {
    return Intl.message(
      'If you have previously registered a quote online through any of our digital channels (Mobile App. or Portal), you can get it back by filling in your Iqama/Saudi ID and either your Email or Quote No. generated back then.',
      name: 'Ifyouhavepreviouslyregisteredaquote',
      desc: '',
      args: [],
    );
  }

  /// `Iqama/Saudi ID.`
  String get IqamaSaudiID {
    return Intl.message(
      'Iqama/Saudi ID.',
      name: 'IqamaSaudiID',
      desc: '',
      args: [],
    );
  }

  /// `Quote No.`
  String get QuoteNo {
    return Intl.message(
      'Quote No.',
      name: 'QuoteNo',
      desc: '',
      args: [],
    );
  }

  /// `Cannot Retrieve Quotation`
  String get CannotRetrieveQuotation {
    return Intl.message(
      'Cannot Retrieve Quotation',
      name: 'CannotRetrieveQuotation',
      desc: '',
      args: [],
    );
  }

  /// `Statement of Account`
  String get StatementOfAccount {
    return Intl.message(
      'Statement of Account',
      name: 'StatementOfAccount',
      desc: '',
      args: [],
    );
  }

  /// `Outstanding Balance`
  String get outstanndingbalance {
    return Intl.message(
      'Outstanding Balance',
      name: 'outstanndingbalance',
      desc: '',
      args: [],
    );
  }

  /// `Cancel Policy`
  String get cancelpolicy {
    return Intl.message(
      'Cancel Policy',
      name: 'cancelpolicy',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Personal Accident`
  String get personalAccident {
    return Intl.message(
      'Personal Accident',
      name: 'personalAccident',
      desc: '',
      args: [],
    );
  }

  /// `SME Medical`
  String get SMEMedical {
    return Intl.message(
      'SME Medical',
      name: 'SMEMedical',
      desc: '',
      args: [],
    );
  }

  /// `Activate Visit Visa`
  String get activateVisitVisa {
    return Intl.message(
      'Activate Visit Visa',
      name: 'activateVisitVisa',
      desc: '',
      args: [],
    );
  }

  /// `Extend Visit Visa`
  String get extendVisitVisa {
    return Intl.message(
      'Extend Visit Visa',
      name: 'extendVisitVisa',
      desc: '',
      args: [],
    );
  }

  /// `Due Amount`
  String get dueAmount {
    return Intl.message(
      'Due Amount',
      name: 'dueAmount',
      desc: '',
      args: [],
    );
  }

  /// `Quote Date`
  String get quoteDate {
    return Intl.message(
      'Quote Date',
      name: 'quoteDate',
      desc: '',
      args: [],
    );
  }

  /// `Is Converted?`
  String get isConverted {
    return Intl.message(
      'Is Converted?',
      name: 'isConverted',
      desc: '',
      args: [],
    );
  }

  /// `No Quotations found for this user`
  String get noQuotes {
    return Intl.message(
      'No Quotations found for this user',
      name: 'noQuotes',
      desc: '',
      args: [],
    );
  }

  /// `Back`
  String get back {
    return Intl.message(
      'Back',
      name: 'back',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Documents Upload`
  String get documentsupload {
    return Intl.message(
      'Documents Upload',
      name: 'documentsupload',
      desc: '',
      args: [],
    );
  }

  /// `total`
  String get total {
    return Intl.message(
      'total',
      name: 'total',
      desc: '',
      args: [],
    );
  }

  /// `Data`
  String get data {
    return Intl.message(
      'Data',
      name: 'data',
      desc: '',
      args: [],
    );
  }

  /// `Field`
  String get field {
    return Intl.message(
      'Field',
      name: 'field',
      desc: '',
      args: [],
    );
  }

  /// `add`
  String get add {
    return Intl.message(
      'add',
      name: 'add',
      desc: '',
      args: [],
    );
  }

  /// `Validation Summary`
  String get validationSummary {
    return Intl.message(
      'Validation Summary',
      name: 'validationSummary',
      desc: '',
      args: [],
    );
  }

  /// `Please fill the following`
  String get pleaseFillTheFollowing {
    return Intl.message(
      'Please fill the following',
      name: 'pleaseFillTheFollowing',
      desc: '',
      args: [],
    );
  }

  /// `Something wrong`
  String get somethingWrong {
    return Intl.message(
      'Something wrong',
      name: 'somethingWrong',
      desc: '',
      args: [],
    );
  }

  /// `Note`
  String get note {
    return Intl.message(
      'Note',
      name: 'note',
      desc: '',
      args: [],
    );
  }

  /// `Operation error`
  String get operationError {
    return Intl.message(
      'Operation error',
      name: 'operationError',
      desc: '',
      args: [],
    );
  }

  /// `Update`
  String get update {
    return Intl.message(
      'Update',
      name: 'update',
      desc: '',
      args: [],
    );
  }

  /// `Confirmation`
  String get confirmation {
    return Intl.message(
      'Confirmation',
      name: 'confirmation',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure want to delete this row ?`
  String get are_you_sure {
    return Intl.message(
      'Are you sure want to delete this row ?',
      name: 'are_you_sure',
      desc: '',
      args: [],
    );
  }

  /// `Update Quotation`
  String get updateQuotation {
    return Intl.message(
      'Update Quotation',
      name: 'updateQuotation',
      desc: '',
      args: [],
    );
  }

  /// `SMS`
  String get sms {
    return Intl.message(
      'SMS',
      name: 'sms',
      desc: '',
      args: [],
    );
  }

  /// `An OTP must be sent to you to continue your registration, How would you like to receive it?`
  String get receiveotp {
    return Intl.message(
      'An OTP must be sent to you to continue your registration, How would you like to receive it?',
      name: 'receiveotp',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verified, press Ok to complete your registration`
  String get otpverified {
    return Intl.message(
      'OTP Verified, press Ok to complete your registration',
      name: 'otpverified',
      desc: '',
      args: [],
    );
  }

  /// `Pay`
  String get Pay {
    return Intl.message(
      'Pay',
      name: 'Pay',
      desc: '',
      args: [],
    );
  }

  /// `Arabian Shield Insurance Company`
  String get ArabianShieldInsuranceCompany {
    return Intl.message(
      'Arabian Shield Insurance Company',
      name: 'ArabianShieldInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `Your Receipt (SAR)`
  String get YourReceipt {
    return Intl.message(
      'Your Receipt (JOD)',
      name: 'YourReceipt',
      desc: '',
      args: [],
    );
  }

  /// `Card Number`
  String get CardNumber {
    return Intl.message(
      'Card Number',
      name: 'CardNumber',
      desc: '',
      args: [],
    );
  }

  /// `MM/YY`
  String get MMYY {
    return Intl.message(
      'MM/YY',
      name: 'MMYY',
      desc: '',
      args: [],
    );
  }

  /// `CVV`
  String get CVV {
    return Intl.message(
      'CVV',
      name: 'CVV',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance - Solidarity`
  String get MedicalInsuranceSolidarity {
    return Intl.message(
      'Medical Insurance - Solidarity',
      name: 'Medical Insurance - Solidarity',
      desc: '',
      args: [],
    );
  }

  /// `Medical Insurance - Mednet`
  String get MedicalInsuranceMednet {
    return Intl.message(
      'Medical Insurance - Mednet',
      name: 'Medical Insurance - Mednet',
      desc: '',
      args: [],
    );
  }

  /// `CVV is invalid`
  String get CVVisinvalid {
    return Intl.message(
      'CVV is invalid',
      name: 'CVVisinvalid',
      desc: '',
      args: [],
    );
  }

  /// `Card Holder Name`
  String get CardHolderName {
    return Intl.message(
      'Card Holder Name',
      name: 'CardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Please Enter Full Card Holder Name`
  String get PleaseEnterFullCardHolderName {
    return Intl.message(
      'Please Enter Full Card Holder Name',
      name: 'PleaseEnterFullCardHolderName',
      desc: '',
      args: [],
    );
  }

  /// `Card Number is Invalid`
  String get CardNumberisInvalid {
    return Intl.message(
      'Card Number is Invalid',
      name: 'CardNumberisInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Expire Date is Invalid`
  String get ExpireDateisInvalid {
    return Intl.message(
      'Expire Date is Invalid',
      name: 'ExpireDateisInvalid',
      desc: '',
      args: [],
    );
  }

  /// `Back To Home`
  String get BackToHome {
    return Intl.message(
      'Back To Home',
      name: 'BackToHome',
      desc: '',
      args: [],
    );
  }

  /// `Gallery`
  String get gallery {
    return Intl.message(
      'Gallery',
      name: 'gallery',
      desc: '',
      args: [],
    );
  }

  /// `Camera`
  String get camera {
    return Intl.message(
      'Camera',
      name: 'camera',
      desc: '',
      args: [],
    );
  }

  /// `Please Choose`
  String get PleaseChoose {
    return Intl.message(
      'Please Choose',
      name: 'PleaseChoose',
      desc: '',
      args: [],
    );
  }

  /// `Card has expired`
  String get Cardhasexpired {
    return Intl.message(
      'Card has expired',
      name: 'Cardhasexpired',
      desc: '',
      args: [],
    );
  }

  /// `Expiry year is invalid`
  String get Expiryyearisinvalid {
    return Intl.message(
      'Expiry year is invalid',
      name: 'Expiryyearisinvalid',
      desc: '',
      args: [],
    );
  }

  /// `Expiry month is invalid`
  String get Expirymonthisinvalid {
    return Intl.message(
      'Expiry month is invalid',
      name: 'Expirymonthisinvalid',
      desc: '',
      args: [],
    );
  }

  /// `fieldDataTable`
  String get fieldDataTable {
    return Intl.message(
      'fieldDataTable',
      name: 'fieldDataTable',
      desc: '',
      args: [],
    );
  }

  /// `please make sure to proceed with the steps correctly`
  String get pleaseMakeSureToProceedWithTheStepsCorrectly {
    return Intl.message(
      'please make sure to proceed with the steps correctly',
      name: 'pleaseMakeSureToProceedWithTheStepsCorrectly',
      desc: '',
      args: [],
    );
  }

  /// `payment reached you can’t update your quotation`
  String get paymentReachedYouCanNotUpdateYourQuotation {
    return Intl.message(
      'payment reached you can’t update your quotation',
      name: 'paymentReachedYouCanNotUpdateYourQuotation',
      desc: '',
      args: [],
    );
  }

  /// `Craftsman Insurance`
  String get CraftsmanInsurance {
    return Intl.message(
      'Craftsman Insurance',
      name: 'CraftsmanInsurance',
      desc: '',
      args: [],
    );
  }

  /// `Renewal`
  String get Renewal {
    return Intl.message(
      'Renewal',
      name: 'Renewal',
      desc: '',
      args: [],
    );
  }

  /// `Medical`
  String get Medical {
    return Intl.message(
      'Medical',
      name: 'Medical',
      desc: '',
      args: [],
    );
  }

  /// `PolicyStatus`
  String get PolicyStatus {
    return Intl.message(
      'PolicyStatus',
      name: 'PolicyStatus',
      desc: '',
      args: [],
    );
  }

  /// `Notexpired`
  String get Notexpired {
    return Intl.message(
      'Not Epired',
      name: 'Not Epired',
      desc: '',
      args: [],
    );
  }

  /// `FIRST INSURANCE COMPANY (FIC'S)`
  String get FirstInsuranceCompany {
    return Intl.message(
      'FIRST INSURANCE COMPANY (FIC\'S)',
      name: 'FirstInsuranceCompany',
      desc: '',
      args: [],
    );
  }

  /// `expired`
  String get expired {
    return Intl.message(
      'Expired',
      name: 'Expired',
      desc: '',
      args: [],
    );
  }

  /// `Medical Network`
  String get medicalNetworkHeader {
    return Intl.message(
      'Medical Network',
      name: 'medicalNetworkHeader',
      desc: '',
      args: [],
    );
  }

  /// `active`
  String get active {
    return Intl.message(
      'active',
      name: 'active',
      desc: '',
      args: [],
    );
  }

  String get TransactionType {
    return Intl.message(
      'TransactionType',
      name: 'TransactionType',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `UpcomingMatches`
  String get upcomingMatches {
    return Intl.message(
      'Upcoming Matches',
      name: 'upcomingMatches',
      desc: '',
      args: [],
    );
  }

  /// `Join`
  String get join {
    return Intl.message(
      'Join',
      name: 'join',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message(
      'More',
      name: 'more',
      desc: '',
      args: [],
    );
  }

  /// `Matches`
  String get matches {
    return Intl.message(
      'Matches',
      name: 'matches',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
      Locale.fromSubtags(languageCode: 'en', countryCode: 'US'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
