import 'package:car_dekho_app/src/packages/domain/model/vehicle_details_model/vehicle_details_model.dart';
import 'package:car_dekho_app/src/packages/helper/custom_text_field.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../logic/vehicle_details_edit_cubit/vehicle_details_edit_cubit.dart';
import '../../utils/logger.dart';

class VehicleDetailsEditScreenView extends StatelessWidget {
  static String routeName = "/VehicleDetailsEditScreenView";

  const VehicleDetailsEditScreenView({super.key});

  static Widget builder(BuildContext context) {
    VehicleDetailsModel? vehicleModel =
        ModalRoute.of(context)!.settings.arguments as VehicleDetailsModel?;
    Log.debug("vehicle Model Edit== $vehicleModel");
    return BlocProvider(
      create: (context) =>
          VehicleDetailsEditCubit()..fetchVehicleDetailArgument(vehicleModel),
      child: const VehicleDetailsEditScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VehicleDetailsEditCubit, VehicleDetailsEditState>(
      builder: (context, state) {
        if (state.isLoading) {
          final globalKey = GlobalKey<FormState>();

          final originalPriceController = TextEditingController(
              text: state.vehicleDetailsModel!.orignalPrice.toString());
          final insuranceController =
              TextEditingController(text: state.vehicleDetailsModel!.insurance);
          final quantityController = TextEditingController(
            text: state.vehicleDetailsModel!.quantity.toString(),
          );
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Form(
                  key: globalKey,
                  child: Column(
                    children: [
                      Text(
                        "Update Details",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                                fontWeight: FontWeight.w500, fontSize: 24),
                      ),
                      const Gap(50),
                      CustomTextField(
                        fieldController: quantityController,
                        fieldName: 'Quantity',
                        autoFocus: false,
                        isReadOnly: false,
                        validator: (p0) {
                          return null;
                        },
                        obscureText: false,
                      ),
                      const Gap(20),
                      CustomTextField(
                        fieldController: insuranceController,
                        fieldName: 'Insurance',
                        autoFocus: false,
                        isReadOnly: false,
                        validator: (p0) {
                          return null;
                        },
                        obscureText: false,
                      ),
                      const Gap(20),
                      CustomTextField(
                        fieldController: originalPriceController,
                        fieldName: 'Car Price',
                        autoFocus: false,
                        isReadOnly: false,
                        validator: (p0) {
                          return null;
                        },
                        obscureText: false,
                      ),
                      const Gap(80),
                      SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                            Map<String, dynamic> vehicleDetailsMap = {
                              'vehicleId': state.vehicleDetailsModel!.id,
                              'quantity': quantityController.text,
                              'insurance': insuranceController.text,
                              'orignalPrice': originalPriceController.text,
                            };
                            Log.debug(
                                "Update Vehicle Btn : $vehicleDetailsMap");
                            if (globalKey.currentState!.validate()) {
                              context
                                  .read<VehicleDetailsEditCubit>()
                                  .updateVehicleDetails(vehicleDetailsMap);
                            }
                          },
                          style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(1),
                            backgroundColor: WidgetStatePropertyAll(
                              AppColors.secondaryColor,
                            ),
                          ),
                          child: Text(
                            "Save",
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
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state.isLogged) {
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  icon: const Icon(HugeIcons.strokeRoundedArrowLeft01)),
            ),
            backgroundColor: AppColors.primaryColor,
            body: Center(
              child: Text(
                "Details are Updated Successful",
                style: Theme.of(context).textTheme.headlineMedium,
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
