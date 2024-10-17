import 'package:car_dekho_app/src/logic/showroom_details_cubit/showroom_details_cubit.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../packages/domain/model/showroom_list_model/showroom_list_model.dart';
import '../../packages/helper/custom_text_field.dart';
import '../../packages/helper/text_field_validator.dart';
import '../../packages/resources/colors.dart';

class ShowroomDetailsScreenView extends StatelessWidget {
  static String routeName = "/ShowroomDetailsScreenView";

  const ShowroomDetailsScreenView({super.key});

  static Widget builder(BuildContext context) {
    final showroomDetailsModel =
        ModalRoute.of(context)!.settings.arguments as ShowroomListDataModel?;
    return BlocProvider(
      create: (context) => ShowroomDetailsCubit()
        ..showroomDetailsFunction(showroomDetailsModel: showroomDetailsModel),
      child: const ShowroomDetailsScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowroomDetailsCubit, ShowroomDetailsState>(
      builder: (context, state) {
        Log.debug(state.showroomListModel);
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(
                  horizontal: 20, vertical: 20),
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
                          "Showroom Details",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: AppColors.blackColor),
                        ),
                        const SizedBox(
                          height: 50,
                          width: 40,
                        ),
                      ],
                    ),
                  ),
                  const Gap(20),
                  Container(
                    height: 340,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: AppColors.secondaryColor,
                          width: 2,
                        ),
                        color: AppColors.primaryColor),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              "Showroom Name:- ${state.showroomListModel?.showroomName ?? ""}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ),
                          const Gap(30),
                          Text(
                            "Owner Name:- ${state.showroomListModel?.ownerName ?? ""}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Gap(30),
                          Text(
                            "License Number:- ${state.showroomListModel?.licenseNumber ?? ""}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Gap(30),
                          Text(
                            "Location:- ${state.showroomListModel?.location ?? ""}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const Gap(30),
                          Text(
                            "Brand Name:- ${state.showroomListModel?.brandName ?? ""}",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          GestureDetector(
                            onTap: () {
                              final cubit =
                                  context.read<ShowroomDetailsCubit>();
                              showUpdateAdminDetailsBottomSheet(
                                  context, state.showroomListModel, cubit);
                            },
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Container(
                                height: 50,
                                width: 50,
                                decoration: BoxDecoration(
                                    color: AppColors.secondaryColor,
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: AppColors.lightColor2)),
                                child: const Icon(
                                  HugeIcons.strokeRoundedEdit01,
                                  color: AppColors.primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

void showUpdateAdminDetailsBottomSheet(BuildContext context,
    ShowroomListDataModel? updateDetails, ShowroomDetailsCubit cubit) {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final showroomNameController =
      TextEditingController(text: updateDetails?.showroomName ?? "");
  final ownerNameController =
      TextEditingController(text: updateDetails?.ownerName ?? "");
  final licenseNumberController =
      TextEditingController(text: updateDetails?.licenseNumber ?? "");
  final locationNameController =
      TextEditingController(text: updateDetails?.location ?? "");
  showModalBottomSheet(
    context: context,
    isScrollControlled: true, // Allow the sheet to scroll if content is large
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom:
              MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Take only the required space
            children: [
              Text(
                "Update Details",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blackColor),
              ),
              const Gap(20),
              CustomTextField(
                fieldController: showroomNameController,
                fieldName: 'ShowroomName',
                autoFocus: false,
                isReadOnly: false,
                validator: (value) => InputValidator.textFieldValidator(
                  FieldType.showroomName,
                  value,
                ),
                obscureText: false,
              ),
              const Gap(20),
              CustomTextField(
                fieldController: ownerNameController,
                fieldName: 'OwnerName',
                autoFocus: false,
                isReadOnly: false,
                validator: (value) => InputValidator.textFieldValidator(
                  FieldType.ownerName,
                  value,
                ),
                obscureText: false,
              ),
              const Gap(20),
              CustomTextField(
                fieldController: licenseNumberController,
                fieldName: 'LicenseNumber',
                autoFocus: false,
                isReadOnly: false,
                validator: (value) => InputValidator.textFieldValidator(
                  FieldType.licenseNumber,
                  value,
                ),
                obscureText: false,
              ),
              const Gap(20),
              CustomTextField(
                fieldController: locationNameController,
                fieldName: 'Location',
                autoFocus: false,
                isReadOnly: false,
                validator: (value) => InputValidator.textFieldValidator(
                  FieldType.location,
                  value,
                ),
                obscureText: false,
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Map<String, dynamic> json = {
                        "showroomName": showroomNameController.text,
                        "ownerName": ownerNameController.text,
                        "licenseNumber": licenseNumberController.text,
                        "location": locationNameController.text,
                      };
                      ShowroomListDataModel? updateShowroomDetails =
                          ShowroomListDataModel.fromJson(json);
                      cubit.updateShowroomDetails(updateShowroomDetails);
                      Navigator.pop(context);
                    },
                    style: const ButtonStyle(
                      elevation: WidgetStatePropertyAll(1),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.secondaryColor,
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      );
    },
  );
}
