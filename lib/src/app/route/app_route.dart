import 'package:car_dekho_app/src/ui/admin_screens_view/admin_profile_screen_view.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/bottom_navigation_view.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/home_screen_view.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/showroom_details_screen_view.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/showroom_screen_view.dart';
import 'package:car_dekho_app/src/ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';
import 'package:car_dekho_app/src/ui/splash_screen_view/splash_screen_view.dart';
import 'package:flutter/cupertino.dart';

import '../../ui/admin_screens_view/add_showroom_screen_view.dart';
import '../../ui/admin_screens_view/add_vehicle_screen_view.dart';
import '../../ui/admin_screens_view/admin_profile_edit_screen_view.dart';
import '../../ui/admin_screens_view/order_vehicle_list_screen_view.dart';
import '../../ui/admin_screens_view/user_document_verify_screen_view.dart';
import '../../ui/admin_screens_view/user_service_list.dart';
import '../../ui/admin_screens_view/vehicle_details_edit_screen_view.dart';
import '../../ui/admin_screens_view/vehicle_details_screen_view.dart';
import '../../ui/admin_screens_view/vehicle_screen_view.dart';
import '../../ui/authentication/admin/sign_up_admin_view/sign_up_admin_view.dart';

class AppRoute {
  static Map<String, WidgetBuilder> get screens => <String, WidgetBuilder>{
        SplashScreenView.routeName: SplashScreenView.builder,
        SignUpAdminView.routeName: SignUpAdminView.builder,
        SignInAdminView.routeName: SignInAdminView.builder,
        HomeScreenView.routeName: HomeScreenView.builder,
        BottomNavigationView.routeName: BottomNavigationView.builder,
        AdminProfileScreenView.routeName: AdminProfileScreenView.builder,
        AdminProfileEditScreenView.routeName:
            AdminProfileEditScreenView.builder,
        AddShowroomScreenView.routeName: AddShowroomScreenView.builder,
        ShowroomScreenView.routeName: ShowroomScreenView.builder,
        ShowroomDetailsScreenView.routeName: ShowroomDetailsScreenView.builder,
        VehicleScreenView.routeName: VehicleScreenView.builder,
        AddVehicleScreenView.routeName: AddVehicleScreenView.builder,
        UserServiceList.routeName: UserServiceList.builder,
        VehicleDetailsScreenView.routeName: VehicleDetailsScreenView.builder,
        VehicleDetailsEditScreenView.routeName:
            VehicleDetailsEditScreenView.builder,
        OrderVehicleListScreenView.routeName:
            OrderVehicleListScreenView.builder,
        UserDocumentVerifyScreenView.routeName:
            UserDocumentVerifyScreenView.builder,
      };
}
