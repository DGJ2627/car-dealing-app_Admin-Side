import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/bottom_navigation_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../../ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';

part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenState(2));

  Future<void> splashScreenTimer(BuildContext context) async {
    String? token = await LocalString.getCurrentAdminToken();
    Future.delayed(
      Duration(seconds: state.splashTimeOver),
      () {
        Navigator.pushReplacementNamed(
          context,
          token == null
              ? SignInAdminView.routeName
              //? BottomNavigationView.routeName
              : BottomNavigationView.routeName,
        );
      },
    );
  }
}
