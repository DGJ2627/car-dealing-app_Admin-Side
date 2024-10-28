import 'package:car_dekho_app/main.dart';
import 'package:car_dekho_app/src/components/add_showroom_form_widget.dart';
import 'package:flutter/material.dart';

import 'package:hugeicons/hugeicons.dart';

import '../logic/add_showroom_cubit/add_showroom_cubit.dart';
import '../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../packages/helper/text_field_validator.dart';
import '../packages/resources/colors.dart';
import '../utils/logger.dart';

abstract interface class AppCustomDialogBox {
  static Future<void> showBrandNameList({
    required BuildContext context,
    required TextEditingController brandNameController,
    required TextEditingController addBrandNameController,
    required String titleName,
    required AddShowroomCubit cubit,
  }) {
    eventBus.on<DeleteBrandNameEvent>().listen(
      (event) {
        cubit.state.brandListDataModel.removeWhere(
          (element) => element.id == event.brandId,
        );
      },
    );
    return showDialog(
      context: context,
      builder: (context) {
        final filteredShowroomList = cubit.state.brandListDataModel
            .where((showroom) => showroom.status != 2)
            .toList();
        Log.info(
            "Filter Function  ${filteredShowroomList.map((e) => e.brandName).toList()}");
        return AlertDialog(
          title: Center(
            child: Text(titleName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600)),
          ),
          content: SizedBox(
            height: 150,
            width: 300,
            child: ListView.builder(
              itemCount: filteredShowroomList.length,
              itemBuilder: (context, index) {
                final brandListName = filteredShowroomList[index];
                Log.info(
                    "Filter Function Brand ${filteredShowroomList[index].brandName}");
                return filteredShowroomList.isEmpty
                    ? const Center(
                        child: Text("Add Brand Name"),
                      )
                    : Card(
                        child: ListTile(
                          onTap: () async {
                            brandNameController.text = brandListName.brandName;
                            await LocalString.uploadBrandID(brandListName.id);
                            Log.info(
                                "Store Brand Name ${brandListName.brandName} \n ${brandNameController.text}");
                            if (context.mounted) {
                              Navigator.pop(context);
                            }
                          },
                          title: Text(
                            brandListName.brandName,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          trailing: IconButton(
                            onPressed: () async {
                              Future.delayed(
                                Duration.zero,
                                () {
                                  cubit.deleteBrandListFunction(
                                      brandListName.id);
                                  eventBus.fire(
                                      DeleteBrandNameEvent(brandListName.id));
                                },
                              );
                            },
                            icon: const Icon(HugeIcons.strokeRoundedDelete01),
                          ),
                        ),
                      );
              },
            ),
          ),
          actions: [
            filteredShowroomList.isEmpty
                ? ElevatedButton(
                    style: const ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                          Size.fromWidth(
                            300,
                          ),
                        ),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.secondaryColor)),
                    onPressed: () {
                      addBrandNameBottomSheet(
                        context,
                        cubit,
                        (p0) => InputValidator.textFieldValidator(
                            FieldType.brand, addBrandNameController.text),
                        addBrandNameController,
                      );
                    },
                    child: Text(
                      "Add Brand Name",
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: AppColors.primaryColor),
                    ),
                  )
                : ElevatedButton(
                    style: const ButtonStyle(
                        fixedSize: WidgetStatePropertyAll(
                          Size.fromWidth(
                            300,
                          ),
                        ),
                        backgroundColor:
                            WidgetStatePropertyAll(AppColors.secondaryColor)),
                    onPressed: () {
                      addBrandNameBottomSheet(
                        context,
                        cubit,
                        (p0) => InputValidator.textFieldValidator(
                            FieldType.brand, addBrandNameController.text),
                        addBrandNameController,
                      );
                    },
                    child: const Icon(
                      Icons.add,
                      color: AppColors.primaryColor,
                    ),
                  )
          ],
        );
      },
    );
  }

  static Future<void> logoutDialog(
      {required BuildContext context,
      required String titleName,
      required void Function()? logoutFunction}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(titleName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
          ),
          content: SizedBox(
            height: 150,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Cancel",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: logoutFunction,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Yes",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static Future<void> userDocumentVerifyDialog({
    required BuildContext context,
    required String titleName,
    required void Function()? approveFunction,
  }) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text(titleName,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600, fontSize: 20)),
          ),
          content: SizedBox(
            height: 150,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Denied",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: approveFunction,
                  child: Container(
                    alignment: AlignmentDirectional.center,
                    height: 60,
                    width: 100,
                    decoration: BoxDecoration(
                        color: AppColors.secondaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        "Approve",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: AppColors.primaryColor),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
