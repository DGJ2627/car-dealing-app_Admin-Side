import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../packages/domain/model/vehicle_details_model/vehicle_details_model.dart';
import '../../utils/logger.dart';

part 'vehicle_details_edit_state.dart';

class VehicleDetailsEditCubit extends Cubit<VehicleDetailsEditState> {
  VehicleDetailsEditCubit()
      : super(const VehicleDetailsEditState(isLoading: true, isLogged: false));

  DioInterceptors dio = DioInterceptors();

  fetchVehicleDetailArgument(VehicleDetailsModel? vehicleModel) {
    try {
      emit(state.copyWith(isLoading: true, vehicleDetailsModel: vehicleModel));
    } catch (e) {
      Log.error("Argument Null VehicleDetailsEditCubit $e");
    }
  }

  Future<void> updateVehicleDetails(
      Map<String, dynamic> vehicleDetailsMap) async {
    try {
      final response = await dio.patch(
          endPoint: ApiEndPoints.updateVehicleDetails, data: vehicleDetailsMap);
      if (response.statusCode == 200) {
        Log.success("updateVehicleDetails API :- ${response.data}");
        emit(state.copyWith(isLoading: false, isLogged: true));
      }
    } catch (e) {
      Log.error("updateVehicleDetails Patch API $e");
    }
  }
}
