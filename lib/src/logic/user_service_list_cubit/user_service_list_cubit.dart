import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/domain/model/user_free_service_list/user_free_service_list.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logger.dart';

part 'user_service_list_state.dart';

class UserServiceListCubit extends Cubit<UserServiceListState> {
  UserServiceListCubit()
      : super(const UserServiceListState(isLoaded: false, isLoading: true)) {
    fetchUserFreeServiceListFunction();
  }

  DioInterceptors dio = DioInterceptors();

  Future<void> fetchUserFreeServiceListFunction() async {
    try {
      final response =
          await dio.get(endPoint: ApiEndPoints.userFreeServiceList);
      if (response.statusCode == 200) {
        final freeServiceList = (response.data as List)
            .map(
              (e) => UserFreeServiceList.fromJson(e),
            )
            .toList();
        emit(state.copyWith(
            isLoading: false,
            isLoaded: true,
            userFreeServiceList: freeServiceList));
      } else {
        Log.debug(
            "fetchUserFreeServiceListFunction Other Status Code \n ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From fetchUserFreeServiceListFunction Get API \n $e");
    }
  }
}
