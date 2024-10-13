import 'package:car_dekho_app/src/logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenView extends StatelessWidget {
  static String routeName = "/HomeScreenView";

  const HomeScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit()..fetchAdminData(),
      child: const HomeScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 40,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.secondaryColor,
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Gap(6),
                        Container(
                          height: 30,
                          width: 30,
                          decoration: const BoxDecoration(
                            color: AppColors.primaryColor,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const Gap(4),
                        Text(
                          state.adminDataModel!.fullName,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.primaryColor),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
