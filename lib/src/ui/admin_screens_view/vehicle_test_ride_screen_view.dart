import 'package:car_dekho_app/src/logic/vehicle_test_ride_cubit/vehicle_test_ride_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../components/app_custom_dialog_box.dart';
import '../../packages/domain/model/vehicle_test_ride_model/vehicle_test_ride_model.dart';
import '../../packages/resources/colors.dart';
import '../../utils/logger.dart';

class VehicleTestRideScreenView extends StatelessWidget {
  static String routeName = "/VehicleTestRideScreenView";

  const VehicleTestRideScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          VehicleTestRideCubit()..fetchVehicleTestRideListFunction(),
      child: const VehicleTestRideScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleTestRideCubit, VehicleTestRideState>(
      builder: (context, state) {
        if (state.vehicleTestRideList.isEmpty) {
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
                        "Not Booking any Test Ride...",
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
        } else if (state.isLoading) {
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
        } else if (state.isLoaded) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "Test Ride",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const Gap(20),
                      Expanded(
                        flex: 9,
                        child: ListView.builder(
                          itemCount: state.vehicleTestRideList.length,
                          // Handle null list
                          itemBuilder: (context, index) {
                            return TestRideListItem(
                                testRide: state.vehicleTestRideList[index]);
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
        return const Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

class TestRideListItem extends StatelessWidget {
  final VehicleTestRideModel testRide;

  const TestRideListItem({super.key, required this.testRide});

  @override
  Widget build(BuildContext context) {
    final serviceStatus = testRide.status != 0; // Simplified logic

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        background:
            const Icon(HugeIcons.strokeRoundedDelete01, color: Colors.red),
        direction: DismissDirection.endToStart,
        key: ValueKey(testRide),
        onDismissed: (direction) {
          context.read<VehicleTestRideCubit>().removeTestRide(testRide);
        },
        child: Card(
          elevation: 2,
          color: Colors.white,
          child: ListTile(
            title: ExpansionTile(
              backgroundColor: AppColors.primaryColor,
              shape: Border.all(color: Colors.transparent),
              title: Text("Ride ID: ${testRide.id}"),
              children: [
                _buildTestRideDetails(context, serviceStatus),
              ],
            ),
          ),
        ),
      ),
    );
  } // Widget for test ride details

  Widget _buildTestRideDetails(BuildContext context, bool rideServiceStatus) {
    final serviceStatus = rideServiceStatus;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("User ID: ${testRide.userId}",
            style: Theme.of(context).textTheme.titleMedium),
        const Gap(10),
        Text("Vehicle ID: ${testRide.vehicleId}",
            style: Theme.of(context).textTheme.titleMedium),
        const Gap(20),
        SizedBox(
          height: 50,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Status :-",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.grey)),
              serviceStatus
                  ? Text("Approved",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.green))
                  : _buildPendingButton(context),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPendingButton(BuildContext context) {
    return ElevatedButton(
      style: const ButtonStyle(
        elevation: WidgetStatePropertyAll(3),
        backgroundColor: WidgetStatePropertyAll(AppColors.secondaryColor),
      ),
      onPressed: () {
        AppCustomDialogBox.userDocumentVerifyDialog(
          context: context,
          titleName: "Test Ride",
          approveFunction: () async {
            String rideMes = await context
                .read<VehicleTestRideCubit>()
                .approvedTestRide(testRide.id);
            Log.success(rideMes);
            if (context.mounted) {
              Navigator.pop(context);
            }
          },
        );
      },
      child: Text("Pending",
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(color: AppColors.primaryColor)),
    );
  }
}
