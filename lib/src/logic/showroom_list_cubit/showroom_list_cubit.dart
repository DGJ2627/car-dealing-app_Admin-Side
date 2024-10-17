import 'package:car_dekho_app/src/packages/domain/model/showroom_list_model/showroom_list_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';
import '../../utils/logger.dart';

part 'showroom_list_state.dart';

class ShowroomListCubit extends Cubit<ShowroomListState> {
  ShowroomListCubit()
      : super(const ShowroomListState(isLogged: false, isLoading: true));
  final DioInterceptors dio = DioInterceptors();

  Future<void> fetchShowroomListDataFunction() async {
    emit(state.copyWith(isLoading: true));
    try {
      final response = await dio.get(endPoint: ApiEndPoints.getShowroomList);

      if (response.statusCode == 200) {
        Log.success(response.data);
        final showroomListData = (response.data as List)
            .map(
              (e) => ShowroomListDataModel.fromJson(e),
            )
            .toList();

        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          showroomListModel: showroomListData,
        ));

        Log.debug(state.showroomListModel);
      } else {
        Log.info(
            "fetchShowroomListDataFunction Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From Get fetchShowroomListDataFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }
}
