import 'package:car_dekho_app/src/logic/admin_profile_edit_cubit/admin_profile_edit_cubit.dart';
import 'package:car_dekho_app/src/packages/domain/model/admin_data_model.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../packages/helper/custom_text_field.dart';
import '../../packages/helper/text_field_validator.dart';

class AdminProfileEditScreenView extends StatelessWidget {
  static String routeName = "/AdminProfileEditScreenView";

  const AdminProfileEditScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminProfileEditCubit(),
      child: const AdminProfileEditScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<FormState>();
    final adminData =
        ModalRoute.of(context)!.settings.arguments as AdminDataModel;
    final nameController = TextEditingController();
    final contactNumberController = TextEditingController();

    Log.debug(adminData);
    nameController.text = adminData.fullName;
    contactNumberController.text = adminData.contactNumber.toString();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Form(
            key: globalKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                          onPressed: () {
                            final updatedAdminDataModel = AdminDataModel(
                              adminData.id,
                              nameController.text,
                              int.parse(contactNumberController.text),
                              adminData.email,
                              adminData.password,
                              adminData.role,
                              adminData.status,
                              adminData.createdAt,
                              adminData.updatedAt,
                              adminData.v,
                            );
                            Navigator.pop(context, updatedAdminDataModel);
                          },
                          icon: const Icon(
                            HugeIcons.strokeRoundedArrowLeft01,
                          ),
                          color: AppColors.blackColor,
                        ),
                        Text(
                          "Edit Screen",
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                        const SizedBox(
                          height: 50,
                          width: 50,
                        ),
                      ],
                    ),
                  ),
                  const Gap(50),
                  //admin details

                  Center(
                    child: Container(
                      height: 120,
                      width: 120,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: AppColors.secondaryColor, width: 2),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  const Gap(30),
                  CustomTextField(
                    fieldController: nameController,
                    fieldName: '',
                    autoFocus: false,
                    isReadOnly: false,
                    validator: (value) => InputValidator.textFieldValidator(
                        FieldType.fullName, value),
                    obscureText: false,
                  ),

                  const Gap(20),
                  CustomTextField(
                    fieldController: contactNumberController,
                    fieldName: '',
                    autoFocus: false,
                    isReadOnly: false,
                    validator: (value) => InputValidator.textFieldValidator(
                        FieldType.contactNumber, value),
                    obscureText: false,
                  ),
                  const Gap(50),
                  Center(
                      child: SizedBox(
                    height: 50,
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        int a = int.parse(contactNumberController.text);
                        Log.debug(a);
                        if (globalKey.currentState!.validate()) {
                          context
                              .read<AdminProfileEditCubit>()
                              .adminDetailsUpdate(nameController.text,
                                  int.parse(contactNumberController.text));
                          Log.debug(nameController);
                          Log.debug(contactNumberController);
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
                        style:
                            Theme.of(context).textTheme.titleMedium!.copyWith(
                                  color: AppColors.primaryColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 18,
                                ),
                      ),
                    ),
                  ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
