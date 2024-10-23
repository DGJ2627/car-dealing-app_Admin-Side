import 'package:flutter/material.dart';

import 'package:hugeicons/hugeicons.dart';

import '../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../packages/domain/model/brand_list_model/brand_list_data.dart';
import '../packages/resources/colors.dart';

abstract interface class AppCustomDialogBox {
  static Future<void> showBrandNameList(
      {required BuildContext context,
      required List<BrandListDataModel>? brandListModel,
      required TextEditingController brandNameController,
      required String titleName,
      required void Function()? deleteBrandFunction}) {
    return showDialog(
      context: context,
      builder: (context) {
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
              itemCount: brandListModel?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () async {
                      brandNameController.text =
                          brandListModel![index].brandName;

                      LocalString.uploadBrandID(brandListModel[index].id);
                      Navigator.pop(context);
                    },
                    title: Text(
                      brandListModel?[index].brandName ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    trailing: IconButton(
                      onPressed: deleteBrandFunction,
                      icon: const Icon(HugeIcons.strokeRoundedDelete01),
                    ),
                  ),
                );
              },
            ),
          ),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                  fixedSize: WidgetStatePropertyAll(
                    Size.fromWidth(
                      300,
                    ),
                  ),
                  backgroundColor:
                      WidgetStatePropertyAll(AppColors.secondaryColor)),
              onPressed: deleteBrandFunction,
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
