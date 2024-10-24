import 'dart:async';

import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/domain/model/vehicle_test_ride_model/vehicle_test_ride_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/packages/resources/stream_subscription.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../utils/logger.dart';

part 'vehicle_test_ride_state.dart';

class VehicleTestRideCubit extends Cubit<VehicleTestRideState> {
  VehicleTestRideCubit()
      : super(const VehicleTestRideState(isLoaded: false, isLoading: true)) {
    fetchVehicleTestRideListFunction();
  }

  DioInterceptors dio = DioInterceptors();

  Future<void> fetchVehicleTestRideListFunction() async {
    try {
      final response =
          await dio.get(endPoint: ApiEndPoints.userVehicleTestRideList);
      if (response.statusCode == 200) {
        final testRideList = (response.data as List)
            .map((e) => VehicleTestRideModel.fromJson(e))
            .toList();

        emit(state.copyWith(
            isLoading: false,
            isLoaded: true,
            vehicleTestRideList: testRideList));
      } else {
        Log.debug(
            "fetchVehicleTestRideListFunction Other Status Code \n ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From fetchVehicleTestRideListFunction Get API \n $e");
    }
  }

  Future<String> approvedTestRide(String rideId) async {
    String rideMessage = '';
    try {
      final response = await dio.post(
        endPoint: ApiEndPoints.userVehicleTestRideApproved,
        data: {
          'rideId': rideId,
        },
      );
      if (response.statusCode == 200) {
        Log.success("Test Ride SuccessFul ${response.statusCode}");
      } else {
        Log.debug(
            "approvedTestRide Other Status Code \n ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From approvedTestRide Get API \n $e");
    }
    return rideMessage;
  }

  void removeTestRide(VehicleTestRideModel testRide) {
    final updatedList = state.vehicleTestRideList
        ?.where((ride) => ride.id != testRide.id)
        .toList();
    emit(state.copyWith(vehicleTestRideList: updatedList));
  }
}
