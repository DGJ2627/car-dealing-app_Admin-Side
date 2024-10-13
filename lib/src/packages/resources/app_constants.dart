import 'package:shared_preferences/shared_preferences.dart';

abstract interface class AppConstants {
  static final emailPatternRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final passwordPatternRegExp = RegExp(
      r'^.*(?=.{8,255})((?=.*[!@#$%^&*_,]))(?=.*\d)((?=.*[A-Z]))((?=.*[a-z])).*$');

  static final mobileNoPatternRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
  static final userNamePatternRegExp = RegExp('[a-zA-Z]');

  static const String baseUrl =
      "https://d21e-2405-201-200c-6876-fc11-538d-d1c9-a30a.ngrok-free.app";

  static storeAdminToken(String token) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('auth_token', token);
  }

  static Future<String?> getCurrentAdminToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('auth_token');
  }
}

abstract interface class ApiEndPoints {
  static const adminSignUp = '/registerAdmin';
  static const adminSignIn = '/adminLogin';
  static const fetchAdminData = '/adminDetails';
}
