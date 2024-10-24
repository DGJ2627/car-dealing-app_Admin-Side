import 'dart:async';
import 'package:car_dekho_app/src/packages/domain/model/admin_data_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../main.dart';
import '../../interceptors/admin/admin_interceptors.dart';
import '../../utils/logger.dart';
import '../admin_profile_cubit/admin_profile_cubit.dart';

part 'admin_profile_edit_state.dart';

class AdminProfileEditCubit extends Cubit<AdminProfileEditState> {
  AdminProfileEditCubit()
      : super(const AdminProfileEditState(isUpdated: false, isLoading: true));

  final DioInterceptors dio = DioInterceptors();

  Future<void> adminDetailsUpdate(AdminDataModel admin) async {
    try {
      final response =
          await dio.patch(endPoint: ApiEndPoints.updateAdminData, data: {
        "contactNumber": admin.contactNumber,
        "fullName": admin.fullName,
      });

      if (response.statusCode == 200) {
        Log.success(response);

        emit(state.copyWith(isLoading: false, isUpdated: true));
        //final adminProfile = AdminDataModel.copyWith();
        eventBus.fire(AdminProfileDetailsUpdateEvent(admin));
      } else {
        Log.error(response.statusCode);
        Log.debug(response);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isUpdated: false));
      Log.error(e);
    }
  }
}
