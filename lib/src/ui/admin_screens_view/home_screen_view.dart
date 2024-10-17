import 'package:car_dekho_app/src/logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';

class HomeScreenView extends StatelessWidget {
  static String routeName = "/HomeScreenView";

  const HomeScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: const HomeScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    // state.adminDataModel!.fullName ??
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              alignment: AlignmentDirectional.center,
                              height: 30,
                              width: 30,
                              decoration: const BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                              ),
                              child: const HugeIcon(
                                  icon: HugeIcons.strokeRoundedLocation01,
                                  color: AppColors.blackColor),
                            ),
                            const Gap(4),
                            Text(
                              "Location",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.primaryColor),
                            ),
                          ],
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.secondaryColor,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.notification,
                                color: AppColors.primaryColor)),
                      ),
                    ],
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
