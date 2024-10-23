import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/packages/domain/model/user_document_verify_model/user_document_verify_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/logger.dart';

part 'user_document_verify_state.dart';

class UserDocumentVerifyCubit extends Cubit<UserDocumentVerifyState> {
  UserDocumentVerifyCubit()
      : super(const UserDocumentVerifyState(isLogged: false, isLoading: true));

  DioInterceptors dio = DioInterceptors();

  Future<void> fetchUserDocumentForVerificationFunction() async {
    try {
      final response = await dio.get(endPoint: ApiEndPoints.userDocumentVerify);
      if (response.statusCode == 200) {
        final documentList = (response.data as List)
            .map((e) => UserDocumentVerifyModel.fromJson(e))
            .toList();

        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          userDocumentList: documentList,
        ));
      } else {
        Log.info(
            "fetchUserDocumentForVerificationFunction Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From Get fetchShowroomListDataFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  Future<void> userDocumentVerificationFunction(String userID) async {
    try {
      final response = await dio.post(
        endPoint: ApiEndPoints.verifyDocuments,
        data: {"userId": userID, "result": "approve"},
      );
      if (response.statusCode == 200) {
        Log.success("Approved Document :- ${response.data}");
        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
        ));
      } else {
        Log.info(
            "userDocumentVerificationFunction Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From POST userDocumentVerificationFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }
}
