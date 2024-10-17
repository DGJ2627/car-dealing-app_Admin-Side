import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';
import '../../packages/domain/model/admin_data_model.dart';
import '../../packages/resources/app_constants.dart';
import '../../utils/logger.dart';

part 'admin_profile_state.dart';

class AdminProfileCubit extends Cubit<AdminProfileState> {
  AdminProfileCubit()
      : super(const AdminProfileState(isLoggedIn: false, isLoading: true));

  final DioInterceptors dio = DioInterceptors();

  Future<void> fetchAdminData() async {
    try {
      final response = await dio.get(endPoint: ApiEndPoints.fetchAdminData);
      if (response.statusCode == 200) {
        final adminData = (response.data as Map<String, dynamic>);
        Log.success("Admin Data :- $adminData");
        emit(state.copyWith(
            adminDataModel: AdminDataModel.fromJson(adminData),
            isLoading: false,
            isLoggedIn: true));
      } else {
        Log.error(
            "Other Status Code From Get Admin API :- ${response.statusCode} \n $response");
        emit(state.copyWith(isLoading: true, isLoggedIn: false));
      }
    } catch (e) {
      Log.error("Error From Get Admin API :- $e");
      emit(state.copyWith(isLoading: true, isLoggedIn: false));
    }
  }

  void updateAdminData(AdminDataModel newAdminData) {
    emit(state.copyWith(adminDataModel: newAdminData));
  }
}
