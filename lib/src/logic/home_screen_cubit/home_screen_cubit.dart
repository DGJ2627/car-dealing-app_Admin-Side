import 'package:car_dekho_app/src/packages/domain/model/admin_data_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';
import '../../services/notification_permission/permission.dart';

part 'home_screen_state.dart';

class HomeScreenCubit extends Cubit<HomeScreenState> {
  HomeScreenCubit()
      : super(const HomeScreenState(isLoading: true, isLoggedIn: false)) {
    _getLocation();
  }

  final DioInterceptors dio = DioInterceptors();

  Future<void> _getLocation() async {
    String location = await AppPermissions.getCurrentLocation("Your location");
    emit(state.copyWith(location: location, isLoading: false));
  }

  // void showLocationContainer(bool isLocationShow) {
  //   isLocationShow != isLocationShow;
  // }
}
