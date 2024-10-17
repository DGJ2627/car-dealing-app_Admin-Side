import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:flutter/material.dart';

import '../packages/domain/model/brand_list_model/brand_list_data.dart';

abstract interface class AppCustomDialogBox {
  static Future<void> showBrandNameList(
      {required BuildContext context,
      required List<BrandListDataModel>? brandListModel,
      required TextEditingController brandNameController}) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Center(
            child: Text("Select Brand Name",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w600)),
          ),
          content: SizedBox(
            height: 200,
            width: 300,
            child: ListView.builder(
              itemCount: brandListModel?.length ?? 0,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    onTap: () async {
                      brandNameController.text =
                          brandListModel![index].brandName;

                      AppConstants.uploadBrandID(brandListModel[index].id);
                      Navigator.pop(context);
                    },
                    title: Text(
                      brandListModel?[index].brandName ?? "",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
