import 'dart:async';

import 'package:car_dekho_app/src/packages/domain/model/vehicle_data_model/vehicle_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../interceptors/admin/admin_interceptors.dart';
import '../../packages/resources/app_constants.dart';
import '../../packages/resources/stream_subscription.dart';
import '../../utils/logger.dart';

part 'vehicle_state.dart';

class VehicleCubit extends Cubit<VehicleState> {
  VehicleCubit() : super(const VehicleState(isLogged: false, isLoading: true)) {
    fetchVehicleListData();
  }
  final DioInterceptors dio = DioInterceptors();

  Future<void> fetchVehicleListData() async {
    try {
      final response = await dio.get(endPoint: ApiEndPoints.getVehicleListData);

      if (response.statusCode == 200) {
        final vehicleListData = (response.data as List)
            .map((e) => VehicleDataModel.fromJson(e))
            .toList();

        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          vehicleListModel: vehicleListData,
        ));
      } else {
        Log.info(
            "fetchVehicleListData Other status Code: - ${response.statusCode} \n ${response.data}");
        emit(state.copyWith(
          isLoading: true,
          isLogged: false,
        ));
      }
    } catch (e) {
      Log.error("Error From Get fetchVehicleListData API :- \n $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }
}
