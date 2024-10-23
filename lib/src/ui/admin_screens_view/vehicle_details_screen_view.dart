import 'package:car_dekho_app/src/ui/admin_screens_view/vehicle_details_edit_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../components/vehicle_feature_list_widget.dart';
import '../../logic/vehicle_details_cubit/vehicle_details_cubit.dart';
import '../../packages/resources/app_constants.dart';
import '../../packages/resources/colors.dart';

class VehicleDetailsScreenView extends StatelessWidget {
  static String routeName = "/VehicleDetailsScreenView";

  const VehicleDetailsScreenView({super.key});

  static Widget builder(BuildContext context) {
    String vehicleId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) =>
          VehicleDetailsCubit()..fetchVehicleDetailsFunction(vehicleId),
      child: const VehicleDetailsScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleDetailsCubit, VehicleDetailsState>(
      builder: (context, state) {
        if (state.isLoading) {
          return const Scaffold(
            body: Center(
              child: Text("Wait Data will Loading"),
            ),
          );
        } else if (state.isLogged) {
          final List<Map<String, dynamic>> vehicleFeatures = [
            {
              'icon': HugeIcons.strokeRoundedCoupon03,
              'featureTitle': "Quantity",
              'featureName': state.vehicleDetailsModel!.quantity,
            },
            {
              'icon': HugeIcons.strokeRoundedSaveMoneyDollar,
              'featureTitle': "Final Price",
              'featureName': AppConstants.formatPriceInLakhsAndCrores(
                  state.vehicleDetailsModel!.finalPrice),
            },
            {
              'icon': HugeIcons.strokeRoundedAutomotiveBattery02,
              'featureTitle': "Power",
              'featureName': state.vehicleDetailsModel!.power,
            },
            {
              'icon': HugeIcons.strokeRoundedDashboardSpeed02,
              'featureTitle': "Mileage",
              'featureName': state.vehicleDetailsModel!.mileage,
            },
            {
              'icon': HugeIcons.strokeRoundedFastWind,
              'featureTitle': "Engine",
              'featureName': state.vehicleDetailsModel!.engine,
            },
            {
              'icon': HugeIcons.strokeRoundedCar01,
              'featureTitle': "BrandName",
              'featureName': state.vehicleDetailsModel!.brandName,
            },
            {
              'icon': HugeIcons.strokeRoundedHealth,
              'featureTitle': "insurance",
              'featureName': state.vehicleDetailsModel!.insurance,
            },
            {
              'icon': HugeIcons.strokeRoundedFuelStation,
              'featureTitle': "fuelType",
              'featureName': state.vehicleDetailsModel!.fuelType,
            },
          ];
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            appBar: AppBar(
              backgroundColor: AppColors.primaryColor,
              leading: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(HugeIcons.strokeRoundedArrowLeft01)),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(
                          context, VehicleDetailsEditScreenView.routeName,
                          arguments: state.vehicleDetailsModel);
                    },
                    icon:
                        const Icon(HugeIcons.strokeRoundedDashboardSquareEdit),
                  ),
                ),
              ],
            ),
            body: SingleChildScrollView(
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: Image.network(
                          "${ApiEndPoints.getVehicleImage}/${state.vehicleDetailsModel!.photo}.png",
                          fit: BoxFit.contain,
                        ),
                      ),
                      const Divider(),
                      Text(
                        state.vehicleDetailsModel!.vehicleName,
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const Gap(20),
                      RatingStars(
                        value: state.vehicleDetailsModel!.stars.toDouble(),
                      ),
                      const Gap(20),
                      Row(
                        children: [
                          Text(
                            "Price: ₹ ${AppConstants.formatPriceInLakhsAndCrores(state.vehicleDetailsModel!.orignalPrice)}",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20),
                          ),
                          const Gap(20),
                          Text(
                            "${AppConstants.findingDiscount(state.vehicleDetailsModel!.orignalPrice.toString(), state.vehicleDetailsModel!.finalPrice.toString())}%",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(fontSize: 20, color: Colors.green),
                          ),
                        ],
                      ),
                      const Gap(20),
                      Text(
                        "Features",
                        style: Theme.of(context).textTheme.titleLarge!.copyWith(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const Gap(20),
                      VehicleFeatureListWidget(
                          vehicleFeatures: vehicleFeatures),
                      const Gap(20),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            context
                                .read<VehicleDetailsCubit>()
                                .deleteShowroomFunction(
                                    state.vehicleDetailsModel!.id);

                            Navigator.pop(
                                context, state.vehicleDetailsModel!.id);
                          },
                          style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(1),
                            backgroundColor: WidgetStatePropertyAll(
                              Colors.red,
                            ),
                          ),
                          child: Text(
                            "Delete",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                          ),
                        ),
                      ),
                      const Gap(20),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
