import 'package:car_dekho_app/main.dart';
import 'package:car_dekho_app/src/components/build_common_states.dart';
import 'package:car_dekho_app/src/logic/vehicle_cubit/vehicle_cubit.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/add_vehicle_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../components/vehicle_show_widget.dart';
import '../../packages/resources/colors.dart';
import '../../utils/logger.dart';

class VehicleScreenView extends StatefulWidget {
  static String routeName = "/ShowroomScreenView";

  const VehicleScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleCubit()..fetchVehicleListData(),
      child: const VehicleScreenView(),
    );
  }

  @override
  State<VehicleScreenView> createState() => _VehicleScreenViewState();
}

class _VehicleScreenViewState extends State<VehicleScreenView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleCubit, VehicleState>(
      builder: (context, state) {
        eventBus.on<DeleteVehicleEvent>().listen(
          (event) {
            state.vehicleListModel.removeWhere(
              (element) => element.id == event.listId,
            );
            setState(() {});
          },
        );
        if (state.vehicleListModel.isEmpty) {
          return BuildCommonState.buildLoadingState(
              context, "Add Vehicle in showroom");
        } else if (state.isLoading) {
          return BuildCommonState.buildLoadingState(
              context, "Add Vehicle in showroom");
        } else if (state.isLogged) {
          final filteredShowroomList = state.vehicleListModel
              .where((showroom) => showroom.status != 2)
              .toList();

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
                            return filteredShowroomList.isEmpty
                                ? ElevatedButton(
                                    style: const ButtonStyle(
                                      elevation: WidgetStatePropertyAll(3),
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppColors.secondaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          AddVehicleScreenView.routeName);
                                    },
                                    child: Text(
                                      "Add Vehicle in Showroom",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: AppColors.blackColor,
                                              fontSize: 50),
                                    ),
                                  )
                                : VehicleShowWidget(
                                    vehicleListData: vehicleListData,
                                    deleteList: filteredShowroomList,
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

class DeleteVehicleEvent {
  String listId;
  DeleteVehicleEvent(this.listId);
}
