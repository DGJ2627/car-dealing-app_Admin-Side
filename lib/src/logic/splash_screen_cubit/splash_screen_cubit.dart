import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/bottom_navigation_view.dart';
import 'package:car_dekho_app/src/ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../packages/resources/app_constants.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenState(2));

  Future<void> splashScreenTimer(BuildContext context) async {
    // In your logout function
    String? token = await AppConstants.getCurrentAdminToken();
    Future.delayed(
      Duration(seconds: state.splashTimeOver),
      () {
        Navigator.pushNamedAndRemoveUntil(
          context,
          token == null
              ? SignInAdminView.routeName
              : BottomNavigationView.routeName,
          (route) => true,
        );
      },
    );
  }
}
