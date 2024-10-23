import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/domain/model/vehicle_details_model/vehicle_details_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logger.dart';

part 'vehicle_details_state.dart';

class VehicleDetailsCubit extends Cubit<VehicleDetailsState> {
  VehicleDetailsCubit()
      : super(const VehicleDetailsState(isLoading: true, isLogged: false));

  DioInterceptors dio = DioInterceptors();

  Future<void> fetchVehicleDetailsFunction(String vehicleId) async {
    Log.success("vehicleId:-- $vehicleId");
    try {
      final response = await dio
          .get(endPoint: ApiEndPoints.vehicleDetails, queryParameters: {
        'vehicleId': vehicleId,
      });

      if (response.statusCode == 200) {
        final vehicleDetails = (response.data as Map<String, dynamic>);
        emit(state.copyWith(
          isLogged: true,
          isLoading: false,
          vehicleDetailsModel: VehicleDetailsModel.fromJson(vehicleDetails),
        ));
      } else {
        Log.info(
            "fetchVehicleDetailsFunction Other status Code: - ${response.statusCode} \n ${response.data}");
        emit(state.copyWith(
          isLoading: true,
          isLogged: false,
        ));
      }
    } catch (e) {
      Log.error("Error From Get fetchVehicleDetailsFunction API :- \n $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  Future<void> deleteShowroomFunction(String vehicleId) async {
    try {
      final response = await dio
          .delete(endPoint: ApiEndPoints.deleteVehicle, queryParameters: {
        'vehicleId': vehicleId,
      });

      if (response.statusCode == 200) {
        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
        ));
      } else {
        Log.info(
            "deleteShowroomFunction Other status Code: -\n ${response.statusCode} \n ${response.data}");
      }
      emit(state.copyWith(
        isLoading: false,
        isLogged: true,
      ));
    } catch (e) {
      Log.error("deleteShowroomFunction :- $e");
      Log.error("deleteShowroomFunction :- ${e.toString()}");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }
}
