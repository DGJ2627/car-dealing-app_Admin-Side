import 'package:shared_preferences/shared_preferences.dart';

abstract interface class LocalString {
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

  static uploadVehicleImageID(String vehicleImageID) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    await prefs.setString('vehicleImageID', vehicleImageID);
  }

  static Future<String?> getUploadVehicleImageID() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('vehicleImageID');
  }

  static Future<void> clearDocAndBrandName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('documentID');
    await prefs.remove('uploadBrandID');
    await prefs.remove('vehicleImageID');
  }

  static Future<void> clearAllSharedPreferencesData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
