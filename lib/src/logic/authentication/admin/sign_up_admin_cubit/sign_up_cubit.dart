import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../packages/domain/model/admin/register_admin_model.dart';
import '../../../../packages/resources/app_constants.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(const SignUpState(isLoggedIn: false, isLoading: true));

  final DioInterceptors dio = DioInterceptors();

  Future<void> signUpFunction(
      {required RegisterAdminModel registerAdminModel,
      required BuildContext context}) async {
    try {
      final response = await dio.post(
        endPoint: ApiEndPoints.adminSignUp,
        data: {
          "password": registerAdminModel.password,
          "email": registerAdminModel.email,
          "contactNumber": registerAdminModel.contactNumber,
          "fullName": registerAdminModel.fullName,
          "role": "sub-admin",
        },
      );
      if (response.statusCode == 200) {
        emit(state.copyWith(isLoading: false, isLoggedIn: true));
        if (context.mounted) {
          Navigator.pushNamed(context, SignInAdminView.routeName);
        }
      } else if (response.statusCode == 422) {
        Log.error(response.statusCode);
        Log.debug(response);
      } else {
        emit(state.copyWith(isLoading: false, isLoggedIn: false));
        Log.error(response.statusCode);
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isLoggedIn: false));
      Log.error(e);
    }
  }
}
