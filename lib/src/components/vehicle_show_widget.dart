import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:shimmer/shimmer.dart';

import '../packages/domain/model/vehicle_data_model/vehicle_data_model.dart';
import '../packages/resources/app_constants.dart';
import '../packages/resources/colors.dart';
import '../ui/admin_screens_view/vehicle_details_screen_view.dart';
import '../utils/logger.dart';

class VehicleShowWidget extends StatelessWidget {
  const VehicleShowWidget({
    super.key,
    required this.vehicleListData,
    required this.deleteList,
  });

  final VehicleDataModel vehicleListData;
  final List<VehicleDataModel> deleteList;

  @override
  Widget build(BuildContext context) {
    Log.debug(
        "Loading Image :: ${ApiEndPoints.getVehicleImage}/${vehicleListData.photo}.png");

    return Container(
      height: 400,
      width: 400,
      decoration: BoxDecoration(
        color: AppColors.primaryColor,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.secondaryColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            child: Container(
              alignment: AlignmentDirectional.center,
              height: 200,
              width: double.infinity,
              child: FutureBuilder(
                future: Future.delayed(const Duration(seconds: 1)),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return Image.network(
                      "${ApiEndPoints.getVehicleImage}/${vehicleListData.photo}.png",
                      fit: BoxFit.cover,
                    );
                  } else {
                    return Shimmer(
                      gradient: const LinearGradient(colors: [
                        Colors.black,
                        Colors.black,
                      ]),
                      child: Image.network(
                        "${ApiEndPoints.getVehicleImage}/${vehicleListData.photo}.png",
                        fit: BoxFit.cover,
                      ),
                    ); // Or your preferred placeholder
                  }
                },
              ),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              vehicleListData.vehicleName,
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontWeight: FontWeight.w500, fontSize: 20),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Price: ₹ ${AppConstants.formatPriceInLakhsAndCrores(vehicleListData.orignalPrice)}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "Special Feature: ${vehicleListData.specialfeature}",
              style: Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(fontSize: 20),
            ),
          ),
          const Gap(10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 45,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.secondaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: IconButton(
                onPressed: () {
                  Log.success("ID:: == ${vehicleListData.id}");
                  Navigator.pushNamed(
                          context, VehicleDetailsScreenView.routeName,
                          arguments: vehicleListData.id)
                      .then(
                    (value) {
                      if (value != null && value == vehicleListData.id) {
                        Log.debug("Delete Vehicle Data Successful $value");
                        deleteList.removeWhere(
                          (element) => element.id == value,
                        );
                      }
                    },
                  );
                },
                icon: const Icon(
                  HugeIcons.strokeRoundedArrowRight01,
                  color: AppColors.primaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
