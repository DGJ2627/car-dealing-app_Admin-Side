import 'package:bloc/bloc.dart';
import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

import '../../packages/domain/model/showroom_list_model/showroom_list_model.dart';
import '../../utils/logger.dart';

part 'showroom_details_state.dart';

class ShowroomDetailsCubit extends Cubit<ShowroomDetailsState> {
  ShowroomDetailsCubit()
      : super(const ShowroomDetailsState(isLogged: false, isLoading: true));

  DioInterceptors dio = DioInterceptors();

  Future<void> showroomDetailsFunction(
      {required ShowroomListDataModel? showroomDetailsModel}) async {
    try {
      emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          showroomListModel: showroomDetailsModel));
    } catch (e) {
      Log.error("showroomDetailsFunction :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  Future<void> updateShowroomDetails(
      ShowroomListDataModel? updateDetails) async {
    try {
      final response = await dio.patch(
        endPoint: ApiEndPoints.uploadShowroomDoc,
        data: {
          "_id": updateDetails!.id,
          "showroomName": updateDetails.showroomName,
          "ownerName": updateDetails.ownerName,
          "licenseNumber": updateDetails.licenseNumber,
          "location": updateDetails.location,
          "verificationDocuments": updateDetails.verificationDocuments,
          "brand": updateDetails.brand,
          "status": updateDetails.status,
          "admin": updateDetails.admin,
          "createdAt": updateDetails.createdAt,
          "updatedAt": updateDetails.updatedAt,
          "__v": updateDetails.v,
          "brandName": updateDetails.brandName,
        },
      );
      if (response.statusCode == 200) {
        emit(state.copyWith(showroomListModel: updateDetails));
        Log.success("updateShowroomDetails :- ${state.showroomListModel}");
      } else {
        Log.info(
            "updateShowroomDetails Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("showroomDetailsFunction :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }
}
