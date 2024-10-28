import 'dart:async';
import 'package:car_dekho_app/main.dart';
import 'package:car_dekho_app/src/packages/domain/model/showroom_list_model/showroom_list_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/packages/resources/stream_subscription.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../interceptors/admin/admin_interceptors.dart';
import '../../utils/logger.dart';

part 'showroom_list_state.dart';

class ShowroomListCubit extends Cubit<ShowroomListState>
    with StreamSubscriptionMixin {
  late StreamSubscription _userAddedSubscription;

  ShowroomListCubit()
      : super(const ShowroomListState(
            isLogged: false, isLoading: true, showroomListModel: [])) {
    fetchShowroomListDataFunction();
    _userAddedSubscription = eventBus.on<AddShowroomEvent>().listen(
      (event) async {
        fetchShowroomListDataFunction();
      },
    );
  }

  final DioInterceptors dio = DioInterceptors();

  Future<void> fetchShowroomListDataFunction() async {
    try {
      final response = await dio.get(endPoint: ApiEndPoints.getShowroomList);

      if (response.statusCode == 200) {
        final showroomListData = (response.data as List)
            .map((e) => ShowroomListDataModel.fromJson(e))
            .toList();

        Log.info("Check Showroom List ${showroomListData.length}");
        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          showroomListModel: showroomListData,
        ));
      } else {
        Log.info(
            "fetchShowroomListDataFunction Other status Code: - ${response.statusCode} \n ${response.data}");
        emit(state.copyWith(isLoading: true, isLogged: false));
      }
    } catch (e) {
      Log.error("Error From Get fetchShowroomListDataFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  Future<void> deleteShowroomFunction(String showroomId) async {
    try {
      final response = await dio
          .delete(endPoint: ApiEndPoints.deleteShowroom, queryParameters: {
        'showroomId': showroomId,
      });

      if (response.statusCode == 200) {
        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          showroomListModel: state.showroomListModel,
        ));
      } else {
        Log.info(
            "deleteShowroomFunction Other status Code: -\n ${response.statusCode} \n ${response.data}");
      }
      emit(state.copyWith(
        isLoading: false,
        isLogged: true,
      ));
    } catch (e) {
      Log.error("deleteShowroomFunction :- $e");
      Log.error("deleteShowroomFunction :- ${e.toString()}");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  @override
  Future<void> close() {
    _userAddedSubscription.cancel();
    return super.close();
  }
}

class AddShowroomEvent {
  AddShowroomEvent();
}
