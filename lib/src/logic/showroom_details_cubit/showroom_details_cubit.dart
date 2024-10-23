import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../packages/domain/model/showroom_list_model/showroom_list_model.dart';
import '../../utils/logger.dart';

part 'showroom_details_state.dart';

class ShowroomDetailsCubit extends Cubit<ShowroomDetailsState> {
  ShowroomDetailsCubit()
      : super(const ShowroomDetailsState(isLogged: false, isLoading: true));

  DioInterceptors dio = DioInterceptors();

  Future<void> fetchShowroomDetailsFunction(String showroomId) async {
    try {
      final response = await dio
          .get(endPoint: ApiEndPoints.getShowroomDetails, queryParameters: {
        'showroomId': showroomId,
      });

      if (response.statusCode == 200) {
        final showroomDetails = (response.data as Map<String, dynamic>);
        emit(state.copyWith(
          showroomListModel: ShowroomListDataModel.fromJson(showroomDetails),
          isLoading: false,
          isLogged: true,
        ));
      } else {
        Log.info(
            "fetchShowroomDetailsFunction Other status Code: -\n ${response.statusCode} \n ${response.data}");
        emit(state.copyWith(
          isLoading: true,
          isLogged: false,
        ));
      }
    } catch (e) {
      Log.error("showroomDetailsFunction :- $e");
      Log.error("showroomDetailsFunction :- ${e.toString()}");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  Future<void> updateShowroomDetailsFunction(
      String id, String fieldName, dynamic value) async {
    Log.error("update ID :- $id");
    try {
      final response = await dio.patch(
        endPoint: ApiEndPoints.updateShowroomDoc,
        data: {
          "showroomId": id,
          fieldName: value,
        },
      );
      if (response.statusCode == 200) {
        emit(state.copyWith(isLoading: false, isLogged: true));
        Log.success("updateShowroomDetails :- ${state.showroomListModel}");
      } else {
        Log.info(
            "updateShowroomDetails Other status Code: - ${response.statusCode} \n ${response.data}");
        emit(state.copyWith(
          isLoading: true,
          isLogged: false,
        ));
      }
    } catch (e) {
      Log.error("showroomDetailsFunction :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

// Future<void> updateShowroomDetails(
//     ShowroomListDataModel? updateDetails) async {
//   Log.error("update ID :- ${updateDetails!.id}");
//   try {
//     final response = await dio.patch(
//       endPoint: ApiEndPoints.updateShowroomDoc,
//       data: {
//         "_id": updateDetails.id,
//         "showroomName": updateDetails.showroomName,
//         "ownerName": updateDetails.ownerName,
//         "licenseNumber": updateDetails.licenseNumber,
//         "location": updateDetails.location,
//       },
//     );
//     if (response.statusCode == 200) {
//       emit(state.copyWith(isLoading: false, isLogged: true));
//       Log.success("updateShowroomDetails :- ${state.showroomListModel}");
//     } else {
//       Log.info(
//           "updateShowroomDetails Other status Code: - ${response.statusCode} \n ${response.data}");
//     }
//   } catch (e) {
//     Log.error("showroomDetailsFunction :- $e");
//     emit(state.copyWith(isLoading: true, isLogged: false));
//   }
// }
}
