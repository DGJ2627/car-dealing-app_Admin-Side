import 'package:car_dekho_app/src/logic/add_vehicle_cubit/add_vehicle_cubit.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../components/add_vehicle_form_widget.dart';
import '../../packages/resources/colors.dart';

class AddVehicleScreenView extends StatelessWidget {
  static String routeName = "/ShowroomScreenView";

  const AddVehicleScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AddVehicleCubit(),
      child: const AddVehicleScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    String showroomId = ModalRoute.of(context)!.settings.arguments as String;
    Log.debug("ShowRoomID \\\\ $showroomId");
    return BlocBuilder<AddVehicleCubit, AddVehicleState>(
      builder: (context, state) {
        final cubit = context.read<AddVehicleCubit>();
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: AppColors.secondaryColor,
                                  width: 2,
                                ),
                                shape: BoxShape.circle,
                                color: AppColors.primaryColor),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: const Icon(
                                HugeIcons.strokeRoundedArrowLeft01,
                                color: AppColors.blackColor,
                              ),
                            ),
                          ),
                          Text(
                            "Add Vehicle",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.blackColor),
                          ),
                          const SizedBox(
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    Expanded(
                      child: AddVehicleFormWidget(
                        globalKey: globalKey,
                        cubit: cubit,
                        showroomId: showroomId,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
