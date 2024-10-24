import 'package:car_dekho_app/src/logic/showroom_details_cubit/showroom_details_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../packages/helper/custom_text_field.dart';
import '../../packages/helper/text_field_validator.dart';
import '../../packages/resources/colors.dart';
import 'add_vehicle_screen_view.dart';

class ShowroomDetailsScreenView extends StatelessWidget {
  static String routeName = "/ShowroomDetailsScreenView";

  const ShowroomDetailsScreenView({super.key});

  static Widget builder(BuildContext context) {
    String showroomId = ModalRoute.of(context)!.settings.arguments as String;
    return BlocProvider(
      create: (context) =>
          ShowroomDetailsCubit()..fetchShowroomDetailsFunction(showroomId),
      child: const ShowroomDetailsScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowroomDetailsCubit, ShowroomDetailsState>(
      builder: (context, state) {
        final cubit = context.read<ShowroomDetailsCubit>();
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
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 2,
                            ),
                            color: AppColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Showroom Name:- ${state.showroomListModel?.showroomName ?? ""}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: () {
                                showUpdateAdminDetailsBottomSheet(
                                  context,
                                  state.showroomListModel!.id,
                                  'showroomName',
                                  state.showroomListModel!.showroomName,
                                  cubit,
                                  (value) => InputValidator.textFieldValidator(
                                    FieldType.showroomName,
                                    value,
                                  ),
                                );
                              },
                              icon: const Icon(HugeIcons.strokeRoundedEdit01),
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 2,
                            ),
                            color: AppColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Owner Name:- ${state.showroomListModel?.ownerName ?? ""}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: () {
                                showUpdateAdminDetailsBottomSheet(
                                  context,
                                  state.showroomListModel!.id,
                                  'ownerName',
                                  state.showroomListModel!.ownerName,
                                  cubit,
                                  (value) => InputValidator.textFieldValidator(
                                    FieldType.ownerName,
                                    value,
                                  ),
                                );
                              },
                              icon: const Icon(HugeIcons.strokeRoundedEdit01),
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 2,
                            ),
                            color: AppColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "License Number:- ${state.showroomListModel?.licenseNumber ?? ""}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: () {
                                showUpdateAdminDetailsBottomSheet(
                                  context,
                                  state.showroomListModel!.id,
                                  'licenseNumber',
                                  state.showroomListModel!.licenseNumber,
                                  cubit,
                                  (value) => InputValidator.textFieldValidator(
                                    FieldType.licenseNumber,
                                    value,
                                  ),
                                );
                              },
                              icon: const Icon(HugeIcons.strokeRoundedEdit01),
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                      Container(
                        padding: const EdgeInsetsDirectional.symmetric(
                            horizontal: 10),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: AppColors.secondaryColor,
                              width: 2,
                            ),
                            color: AppColors.primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Location:- ${state.showroomListModel?.location ?? ""}",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            IconButton(
                              onPressed: () {
                                showUpdateAdminDetailsBottomSheet(
                                  context,
                                  state.showroomListModel!.id,
                                  'location',
                                  state.showroomListModel!.location,
                                  cubit,
                                  (value) => InputValidator.textFieldValidator(
                                    FieldType.location,
                                    value,
                                  ),
                                );
                              },
                              icon: const Icon(HugeIcons.strokeRoundedEdit01),
                            ),
                          ],
                        ),
                      ),
                      const Gap(30),
                    ],
                  )
                ],
              ),
            ),
          ),
          floatingActionButton: Theme(
            data: ThemeData(useMaterial3: false),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              child: FloatingActionButton.extended(
                backgroundColor: AppColors.secondaryColor,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    AddVehicleScreenView.routeName,
                    arguments: state.showroomListModel!.id,
                  );
                },
                label: const Text("Add Vehicle"),
              ),
            ),
          ),
        );
      },
    );
  }
}

void showUpdateAdminDetailsBottomSheet(
    BuildContext context,
    String showroomID,
    String textFieldName,
    String textFieldValue,
    ShowroomDetailsCubit cubit,
    String? Function(String?)? validator) {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  final fieldController = TextEditingController(text: textFieldValue);
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
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
                fieldController: fieldController,
                fieldName: textFieldName,
                autoFocus: false,
                isReadOnly: false,
                validator: validator,
                obscureText: false,
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      cubit.updateShowroomDetailsFunction(
                          showroomID, textFieldName, fieldController.text);
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
