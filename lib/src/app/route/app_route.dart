import 'package:car_dekho_app/src/ui/admin_screens_view/bottom_navigation_view.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/home_screen_view.dart';
import 'package:car_dekho_app/src/ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';
import 'package:car_dekho_app/src/ui/splash_screen_view/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/authentication/admin/sign_up_admin_view/sign_up_admin_view.dart';

class AppRoute {
  static Map<String, WidgetBuilder> get screens => <String, WidgetBuilder>{
        SplashScreenView.routeName: SplashScreenView.builder,
        SignUpAdminView.routeName: SignUpAdminView.builder,
        SignInAdminView.routeName: SignInAdminView.builder,
        HomeScreenView.routeName: HomeScreenView.builder,
        BottomNavigationView.routeName: BottomNavigationView.builder,
      };
}
