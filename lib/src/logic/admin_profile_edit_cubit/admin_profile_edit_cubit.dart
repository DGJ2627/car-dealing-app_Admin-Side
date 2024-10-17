import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';
import '../../utils/logger.dart';

part 'admin_profile_edit_state.dart';

class AdminProfileEditCubit extends Cubit<AdminProfileEditState> {
  AdminProfileEditCubit()
      : super(const AdminProfileEditState(isUpdated: false, isLoading: true));

  final DioInterceptors dio = DioInterceptors();

  Future<void> adminDetailsUpdate(String name, int contactNumber) async {
    try {
      final response =
          await dio.patch(endPoint: ApiEndPoints.updateAdminData, data: {
        "contactNumber": contactNumber,
        "fullName": name,
      });

      if (response.statusCode == 200) {
        Log.success(response);
        emit(state.copyWith(isLoading: false, isUpdated: true));
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
