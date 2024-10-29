import 'dart:async';
import 'package:car_dekho_app/src/packages/helper/toast_messge.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

abstract interface class AppPermissions {
  static Future<String> getCurrentLocation(String locationMessage) async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        locationMessage = "Location permissions are denied";

        ToastMessage.showErrorToast(
            "Location Permission Denied", locationMessage);
        return locationMessage;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      locationMessage = "Location permissions are permanently denied";
      ToastMessage.showErrorToast(
          "Location Permission permanently Denied", locationMessage);
      return locationMessage;
    }

    LocationSettings locationSettings = const LocationSettings(
      accuracy: LocationAccuracy.high,
      distanceFilter: 100,
    );

    return Geolocator.getPositionStream(locationSettings: locationSettings)
        .first
        .then((Position position) async {
      List<Placemark> placeMarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placeMarks[0];
      locationMessage = "${place.locality}, ${place.administrativeArea}";
      return locationMessage;
    });
  }
}
