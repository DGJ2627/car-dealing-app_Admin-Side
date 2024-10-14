import 'package:car_dekho_app/src/logic/admin_profile_cubit/admin_profile_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AdminProfileScreenView extends StatelessWidget {
  static String routeName = "/AdminProfileScreenView";

  const AdminProfileScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AdminProfileCubit(),
      child: const AdminProfileScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Center(
            child: Column(
              //mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      radius: 30,
                    ),
                    Text(
                      "User Name",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      style: const ButtonStyle(
                          elevation: WidgetStatePropertyAll(0),
                          fixedSize: WidgetStatePropertyAll(
                            Size.fromWidth(80),
                          ),
                          backgroundColor:
                              WidgetStatePropertyAll(AppColors.secondaryColor)),
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
                //  Gap(20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
