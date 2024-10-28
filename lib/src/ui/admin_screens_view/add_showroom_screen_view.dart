import 'package:car_dekho_app/src/logic/add_showroom_cubit/add_showroom_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../components/add_showroom_form_widget.dart';

class AddShowroomScreenView extends StatelessWidget {
  static String routeName = "/AddShowroomScreenView";

  const AddShowroomScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => AddShowroomCubit()..fetchBrandNameList(),
      child: const AddShowroomScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddShowroomCubit, AddShowroomState>(
      builder: (context, state) {
        final globalKey = GlobalKey<FormState>();
        final cubit = context.read<AddShowroomCubit>();
        return Scaffold(
          body: SingleChildScrollView(
            child: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                            "Add Showroom",
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: AppColors.blackColor),
                          ),
                          const SizedBox(
                            height: 50,
                            width: 50,
                          ),
                        ],
                      ),
                    ),
                    const Gap(30),
                    AddShowroomFormWidget(
                      globalKey: globalKey,
                      cubit: cubit,
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
