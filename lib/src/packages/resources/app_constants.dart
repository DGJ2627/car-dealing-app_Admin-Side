import 'package:flutter/material.dart';

abstract interface class AppConstants {
  static final emailPatternRegExp = RegExp(
    r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
  );
  static final passwordPatternRegExp = RegExp(
      r'^.*(?=.{8,255})((?=.*[!@#$%^&*_,]))(?=.*\d)((?=.*[A-Z]))((?=.*[a-z])).*$');

  static final mobileNoPatternRegExp = RegExp(r'(^(?:[+0]9)?[0-9]{10}$)');
  static final userNamePatternRegExp = RegExp('[a-zA-Z]');

  static final licenseNoPatternRegExp = RegExp(r'^[a-zA-Z]{5}[0-9]{5}$');

  // base url
  static const String baseUrl = "https://4495-49-36-83-135.ngrok-free.app";

  static String formatPriceInLakhsAndCrores(int price) {
    if (price >= 10000000) {
      final crores = price / 10000000.0;
      return '${crores.toStringAsFixed(2)} Crores';
    } else if (price >= 100000) {
      final lakhs = price / 100000.0;
      return '${lakhs.toStringAsFixed(2)} Lakhs';
    } else {
      return '₹$price';
    }
  }

  static String findingDiscount(String originalPrice, String discountedPrice) {
    double discountAmount =
        double.parse(originalPrice) - double.parse(discountedPrice);

    double discountPercentage =
        (discountAmount / double.parse(originalPrice)) * 100;
    return discountPercentage.toString();
  }

  static Map<String, dynamic> extractFormData(
      List<Map<String, dynamic>> fields, Map<String, String> fieldMapping) {
    final data = <String, dynamic>{};

    for (final field in fields) {
      final fieldName = field['fieldName'] as String;
      final fieldController = field['fieldController'] as TextEditingController;
      final modelProperty = fieldMapping[fieldName];

      if (modelProperty != null) {
        if (modelProperty == 'orignalPrice' || modelProperty == 'quantity') {
          data[modelProperty] =
              int.tryParse(fieldController.text) ?? 0; // Handle parsing errors
        } else {
          data[modelProperty] = fieldController.text;
        }
      }
    }

    return data;
  }
}

abstract interface class ApiEndPoints {
  // login and sing up
  static const adminSignUp = '/registerAdmin';
  static const adminSignIn = '/adminLogin';

  //=================================================//

  // Admin data api
  static const fetchAdminData = '/adminDetails';
  static const updateAdminData = '/updateAdminProfile';
  static const logoutAdminData = '/deleteAdmin';

  //=================================================//

  // showroom api
  static const addShowroom = '/addShowroom';
  static const getShowroomList = '/showroomList';
  static const getShowroomDetails = '/showroomDetails';
  static const addBrand = '/addBrand';
  static const showBrandList = '/brandList';
  static const uploadShowroomDoc = '/uploadShowroomDocuments';
  static const updateShowroomDoc = '/updateShowroomDetails';
  static const deleteShowroom = '/deleteShowroom';

  //=================================================//

  // vehicle api
  static const getVehicleListData = '/adminvehicleList';
  static const addVehiclesData = '/addVehicles';
  static const uploadVehicleImage = '/uploadVehiclePhoto';
  static const getVehicleImage =
      '${AppConstants.baseUrl}/uploads/vehiclesPhoto/';

  static const vehicleDetails = "/vehicleDetails";
  static const updateVehicleDetails = "/updateVehicleDetails";
  static const deleteVehicle = "/deleteVehicle";
  static const userOrderVehicleList = "/userOrderList";

//=================================================//

// user document verify api
  static const userDocumentVerify = "/userDetails";
  static const verifyDocuments = "/verifyDocuments";

//=================================================//
}
