import 'package:car_dekho_app/src/ui/admin_screens_view/bottom_navigation_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../interceptors/admin/admin_interceptors.dart';
import '../../../../packages/resources/app_constants.dart';
import '../../../../utils/logger.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit() : super(const SignInState(isLoggedIn: false, isLoading: true));

  final DioInterceptors dio = DioInterceptors();
  //final BuildContext context;

  Future<void> signInFunction(
      {required String email,
      required String password,
      required BuildContext context}) async {
    try {
      final response = await dio.post(
        endPoint: ApiEndPoints.adminSignIn,
        data: {
          "email": email,
          "password": password,
        },
      );
      if (response.statusCode == 200) {
        String token = response.data['token'];

        //save admin token
        AppConstants.storeAdminToken(token);
        emit(state.copyWith(isLoading: false, isLoggedIn: true));

        //navigate in home screen
        Navigator.pushNamedAndRemoveUntil(
            context, BottomNavigationView.routeName, (route) => true);
      } else if (response.statusCode == 422) {
        Log.error(response.statusCode);

        Log.debug(response);
        emit(state.copyWith(isLoading: false, isLoggedIn: false));
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setBool('isLoggedIn', true);
      } else {
        emit(state.copyWith(isLoading: false, isLoggedIn: false));
        Log.error(response.statusCode);
        emit(state.copyWith(isLoading: false, isLoggedIn: false));
      }
    } catch (e) {
      emit(state.copyWith(isLoading: false, isLoggedIn: false));
      Log.error(e);
      emit(state.copyWith(isLoading: false, isLoggedIn: false));
    }
  }
}
