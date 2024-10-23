import 'package:car_dekho_app/src/logic/vehicle_cubit/vehicle_cubit.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/add_vehicle_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../components/VehicleShowWidget.dart';
import '../../packages/resources/colors.dart';
import '../../utils/logger.dart';

class VehicleScreenView extends StatelessWidget {
  static String routeName = "/ShowroomScreenView";

  const VehicleScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleCubit()..fetchVehicleListData(),
      child: const VehicleScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleCubit, VehicleState>(
      builder: (context, state) {
        Log.debug(state.vehicleListModel?.length);
        if (state.isLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Data will Loading...",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state.isLogged) {
          final filteredShowroomList = state.vehicleListModel!
              .where((showroom) => showroom.status != 2)
              .toList();
          // return filteredShowroomList.isEmpty
          //     ? Scaffold(
          //         backgroundColor: AppColors.primaryColor,
          //         body: SafeArea(
          //           child: Padding(
          //             padding: const EdgeInsets.symmetric(
          //                 horizontal: 20, vertical: 20),
          //             child: Center(
          //               child: Column(
          //                 mainAxisAlignment: MainAxisAlignment.center,
          //                 children: [
          //                   Text(
          //                     "Add Vehicle in Showroom",
          //                     style: Theme.of(context)
          //                         .textTheme
          //                         .titleLarge!
          //                         .copyWith(fontSize: 20),
          //                   ),
          //                   const Gap(50),
          //                   Padding(
          //                     padding:
          //                         const EdgeInsets.symmetric(horizontal: 20),
          //                     child: SizedBox(
          //                       height: 50,
          //                       width: double.infinity,
          //                       child: ElevatedButton(
          //                         onPressed: () {
          //                           Navigator.pushNamed(context,
          //                               AddVehicleScreenView.routeName);
          //                         },
          //                         style: const ButtonStyle(
          //                           elevation: WidgetStatePropertyAll(1),
          //                           backgroundColor: WidgetStatePropertyAll(
          //                             AppColors.secondaryColor,
          //                           ),
          //                         ),
          //                         child: Text(
          //                           "Add",
          //                           style: Theme.of(context)
          //                               .textTheme
          //                               .titleMedium!
          //                               .copyWith(
          //                                 color: AppColors.primaryColor,
          //                                 fontWeight: FontWeight.w600,
          //                                 fontSize: 18,
          //                               ),
          //                         ),
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ),
          //         ),
          //       )
          //     :

          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Showroom Vehicle's",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.blackColor),
                        ),
                      ),
                      const Gap(30),
                      Expanded(
                        child: GridView.builder(
                          scrollDirection: Axis.vertical,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 1,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 20,
                                  childAspectRatio: 0.9),
                          itemCount: filteredShowroomList.length,
                          itemBuilder: (context, index) {
                            final vehicleListData = filteredShowroomList[index];

                            Log.debug(vehicleListData);
                            return VehicleShowWidget(
                              vehicleListData: vehicleListData,
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Placeholder();
      },
    );
  }
}
