import 'package:car_dekho_app/src/components/app_custom_dialog_box.dart';
import 'package:car_dekho_app/src/logic/admin_profile_cubit/admin_profile_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:car_dekho_app/src/ui/authentication/admin/sign_in_admin_view/sign_in_admin_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../../packages/domain/model/admin_data_model.dart';
import 'admin_profile_edit_screen_view.dart';

class AdminProfileScreenView extends StatefulWidget {
  static String routeName = "/AdminProfileScreenView";

  const AdminProfileScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminProfileCubit()..fetchAdminData(),
      child: const AdminProfileScreenView(),
    );
  }

  @override
  State<AdminProfileScreenView> createState() => _AdminProfileScreenViewState();
}

class _AdminProfileScreenViewState extends State<AdminProfileScreenView> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<AdminProfileCubit>().fetchAdminData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AdminProfileCubit, AdminProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: AppColors.primaryColor,
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: AppColors.secondaryColor, width: 2)),
                          child: const HugeIcon(
                              icon: HugeIcons.strokeRoundedUser,
                              color: AppColors.blackColor),
                        ),
                        Text(
                          state.adminDataModel?.fullName ?? "Loading",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(
                                  color: AppColors.blackColor, fontSize: 20),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pushNamed(context,
                                    AdminProfileEditScreenView.routeName,
                                    arguments: state.adminDataModel)
                                .then((result) {
                              if (result != null && result is AdminDataModel) {
                                context
                                    .read<AdminProfileCubit>()
                                    .updateAdminData(result);
                              }
                            });
                          },
                          style: const ButtonStyle(
                              elevation: WidgetStatePropertyAll(0),
                              fixedSize: WidgetStatePropertyAll(
                                Size.fromWidth(80),
                              ),
                              backgroundColor: WidgetStatePropertyAll(
                                  AppColors.secondaryColor)),
                          child: Text(
                            "Edit",
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium!
                                .copyWith(
                                    fontWeight: FontWeight.w500,
                                    color: AppColors.primaryColor),
                          ),
                        )
                      ],
                    ),
                    const Gap(20),
                    const Divider(height: 1.0),
                    const Gap(20),
                    GestureDetector(
                      onTap: () {
                        AppCustomDialogBox.logoutDialog(
                          context: context,
                          titleName: 'You want Logout',
                          logoutFunction: () async {
                            context
                                .read<AdminProfileCubit>()
                                .deleteAdminFunction();
                            await LocalString.clearAllSharedPreferencesData();
                            Navigator.pushReplacementNamed(
                              context,
                              SignInAdminView.routeName,
                            );
                          },
                        );
                      },
                      child: Container(
                        alignment: AlignmentDirectional.centerStart,
                        height: 60,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Logout",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                              const HugeIcon(
                                  icon: HugeIcons.strokeRoundedArrowRight01,
                                  color: AppColors.primaryColor)
                            ],
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
      },
    );
  }
}
