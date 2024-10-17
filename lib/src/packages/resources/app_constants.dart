import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AppConstants {
  static final emailPatternRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final passwordPatternRegExp = RegExp(
      r'^.*(?=.{8,255})((?=.*[!@#$%^&*_,]))(?=.*\d)((?=.*[A-Z]))((?=.*[a-z])).*$');

  static final mobileNoPatternRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
  static final userNamePatternRegExp = RegExp('[a-zA-Z]');

  static final licenseNoPatternRegExp = RegExp(r'^[a-zA-Z]{5}[0-9]{5}$');
  static const String baseUrl =
      "https://f5f2-2405-201-200c-6876-dc0b-bb4a-7428-bd41.ngrok-free.app";

  static storeAdminToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('auth_token', token);
  }

  static Future<String?> getCurrentAdminToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }

  static uploadDocumentID(String documentID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('documentID', documentID);
  }

  static Future<String?> getUploadDocumentID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('documentID');
  }

  static uploadBrandID(String uploadBrandID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('uploadBrandID', uploadBrandID);
  }

  static Future<String?> getUploadBrandID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('uploadBrandID');
  }

  static Future<void> clearDocAndBrandName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('documentID');
    await prefs.remove('uploadBrandID');
  }

  static Future<void> clearAllSharedPreferencesData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}

abstract interface class ApiEndPoints {
  static const adminSignUp = '/registerAdmin';
  static const adminSignIn = '/adminLogin';
  static const fetchAdminData = '/adminDetails';
  static const updateAdminData = '/updateAdminProfile';
  static const addShowroom = '/addShowroom';
  static const getShowroomList = '/showroomList';
  static const addBrand = '/addBrand';
  static const showBrandList = '/brandList';
  static const uploadShowroomDoc = '/uploadShowroomDocuments';
}
