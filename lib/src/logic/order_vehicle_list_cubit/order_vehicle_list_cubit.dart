import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../packages/domain/model/order_vehicle_list_model/order_vehicle_list_model.dart';

part 'order_vehicle_list_state.dart';

class OrderVehicleListCubit extends Cubit<OrderVehicleListState> {
  OrderVehicleListCubit()
      : super(const OrderVehicleListState(
            isLoading: true, isLogged: false, orderVehicleList: []));

  DioInterceptors dio = DioInterceptors();

  Future<void> fetchOrderVehicleListFunction() async {
    try {
      final response =
          await dio.get(endPoint: ApiEndPoints.userOrderVehicleList);

      if (response.statusCode == 200) {
        final orderVehicleList = (response.data as List)
            .map((e) => OrderVehicleListModel.fromJson(e))
            .toList();

        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          orderVehicleList: orderVehicleList,
        ));
      } else {
        Log.info(
            "fetchOrderVehicleListFunction Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From Get fetchOrderVehicleListFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }
}
