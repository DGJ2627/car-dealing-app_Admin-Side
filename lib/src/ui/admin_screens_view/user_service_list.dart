import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../logic/user_service_list_cubit/user_service_list_cubit.dart';

class UserServiceList extends StatelessWidget {
  static String routeName = "/UserServiceList";

  const UserServiceList({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => UserServiceListCubit(),
      child: const UserServiceList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      appBar: AppBar(),
    );
  }
}
