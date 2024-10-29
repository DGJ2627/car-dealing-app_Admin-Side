import 'dart:async';

import 'package:car_dekho_app/main.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';
import '../../packages/domain/model/admin_data_model.dart';
import '../../packages/resources/app_constants.dart';
import '../../packages/resources/stream_subscription.dart';
import '../../utils/logger.dart';

part 'admin_profile_state.dart';

class AdminProfileCubit extends Cubit<AdminProfileState>
    with StreamSubscriptionMixin {
  late StreamSubscription _userAddedSubscription;

  AdminProfileCubit()
      : super(const AdminProfileState(isLoggedIn: false, isLoading: true)) {
    fetchAdminData();
    _userAddedSubscription =
        eventBus.on<AdminProfileDetailsUpdateEvent>().listen(
      (event) {
        emit(state.copyWith(adminDataModel: event.adminDataModel));
      },
    );
  }

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
          isLoggedIn: true,
        ));
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

  Future<void> deleteAdminFunction() async {
    try {
      final response = await dio.delete(
        endPoint: ApiEndPoints.logoutAdminData,
      );
      if (response.statusCode == 200) {
        emit(state.copyWith(
          isLoading: false,
          isLoggedIn: true,
        ));
      } else {
        Log.info(
            "deleteAdminFunction Other status Code: -\n ${response.statusCode} \n ${response.data}");
      }
      emit(state.copyWith(
        isLoading: false,
        isLoggedIn: true,
      ));
    } catch (e) {
      Log.error("deleteAdminFunction :- $e");
      Log.error("deleteAdminFunction :- ${e.toString()}");
      emit(state.copyWith(isLoading: true, isLoggedIn: false));
    }
  }

  @override
  Future<void> close() {
    _userAddedSubscription.cancel();
    return super.close();
  }
}

class AdminProfileDetailsUpdateEvent {
  final AdminDataModel adminDataModel;

  AdminProfileDetailsUpdateEvent(this.adminDataModel);
}
