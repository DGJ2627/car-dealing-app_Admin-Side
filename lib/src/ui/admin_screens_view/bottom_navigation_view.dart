import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:car_dekho_app/src/logic/admin_profile_cubit/admin_profile_cubit.dart';
import 'package:car_dekho_app/src/logic/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:car_dekho_app/src/logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:car_dekho_app/src/logic/showroom_list_cubit/showroom_list_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/showroom_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hugeicons/hugeicons.dart';

import 'add_showroom_screen_view.dart';

class BottomNavigationView extends StatelessWidget {
  static String routeName = "/BottomNavigationView";

  const BottomNavigationView({super.key});

  static Widget builder(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => BottomNavigationCubit()),
        BlocProvider(create: (context) => HomeScreenCubit()),
        BlocProvider(create: (context) => ShowroomListCubit(),),
        BlocProvider(create: (context) => AdminProfileCubit()),
      ],
      child: const BottomNavigationView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        return Scaffold(
          body: state.screen[state.currentIndex],
          bottomNavigationBar: AnimatedBottomNavigationBar.builder(
            itemCount: state.screenIcon.length,
            tabBuilder: (index, isActive) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  HugeIcon(
                    icon: state.screenIcon[index],
                    color: isActive
                        ? AppColors.lightColor
                        : AppColors.primaryColor,
                  ),
                  Text(
                    state.screenName[index].toString(),
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: isActive
                            ? AppColors.lightColor
                            : AppColors.primaryColor),
                  ),
                ],
              );
            },
            backgroundColor: AppColors.secondaryColor,
            gapLocation: GapLocation.center,
            rightCornerRadius: 40,
            leftCornerRadius: 40,
            height: 60,
            elevation: 0,
            activeIndex: state.currentIndex,
            onTap: (index) {
              context
                  .read<BottomNavigationCubit>()
                  .updateNavigationIndex(index);
            },
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton: Theme(
            data: ThemeData(useMaterial3: false),
            child: SizedBox(
              height: 60,
              width: 60,
              child: FloatingActionButton(
                onPressed: () {
                  Navigator.pushNamed(context, AddShowroomScreenView.routeName);
                },
                child: Container(
                    height: 60,
                    width: 60,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppColors.primaryColor,
                    ),
                    child: const Icon(Icons.add,
                        size: 30, color: AppColors.blackColor)),
              ),
            ),
          ),
        );
      },
    );
  }
}

/*

*/
