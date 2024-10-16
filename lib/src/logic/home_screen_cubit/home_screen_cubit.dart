import 'package:car_dekho_app/src/packages/domain/model/admin_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit()
      : super(const HomeScreenState(isLoading: true, isLoggedIn: false));

  final DioInterceptors dio = DioInterceptors();

  // Future<void> fetchAdminData() async {
  //   try {
  //     final response = await dio.get(endPoint: ApiEndPoints.fetchAdminData);
  //     if (response.statusCode == 200) {
  //       final adminData = (response.data as Map<String, dynamic>);
  //       Log.success("Admin Data :- $adminData");
  //       emit(state.copyWith(
  //           isLoading: false,
  //           isLoggedIn: true,
  //           adminDataModel: AdminDataModel.fromJson(adminData)));
  //     } else {
  //       Log.error(
  //           "Other Status Code From Get Admin API :- ${response.statusCode} \n $response");
  //       emit(state.copyWith(isLoading: true, isLoggedIn: false));
  //     }
  //   } catch (e) {
  //     Log.error("Error From Get Admin API :- $e");
  //     emit(state.copyWith(isLoading: true, isLoggedIn: false));
  //   }
  // }
}
