import 'package:car_dekho_app/src/components/build_common_states.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../logic/user_service_list_cubit/user_service_list_cubit.dart';
import '../../utils/logger.dart';

class UserServiceList extends StatelessWidget {
  static String routeName = "/UserServiceList";

  const UserServiceList({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserServiceListCubit()..fetchUserFreeServiceListFunction(),
      child: const UserServiceList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserServiceListCubit, UserServiceListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return BuildCommonState.buildLoadingState(
              context, "Data will Loading...");
        } else if (state.userFreeServiceList.isEmpty) {
          return BuildCommonState.buildLoadingState(
              context, "No any Vehicle Service ...");
        } else if (state.isLoaded) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Column(
                    children: [
                      Text(
                        "User Service",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                fontSize: 24, fontWeight: FontWeight.w500),
                      ),
                      const Gap(20),
                      Expanded(
                        flex: 9,
                        child: ListView.builder(
                          itemCount: state.userFreeServiceList.length,
                          itemBuilder: (context, index) {
                            final serviceList =
                                state.userFreeServiceList[index];
                            final serviceStatus =
                                serviceList.status == 0 ? false : true;
                            Log.success(serviceList);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Dismissible(
                                background: const Icon(
                                  HugeIcons.strokeRoundedDelete01,
                                  color: Colors.red,
                                ),
                                direction: DismissDirection.endToStart,
                                key: ValueKey(serviceList),
                                onDismissed: (direction) {
                                  state.userFreeServiceList.removeAt(index);
                                },
                                child: Card(
                                  elevation: 2,
                                  color: Colors.white,
                                  child: ListTile(
                                    title: ExpansionTile(
                                      backgroundColor: AppColors.primaryColor,
                                      shape:
                                          Border.all(color: Colors.transparent),
                                      title:
                                          Text("Service ID: ${serviceList.id}"),
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "User ID: ${serviceList.userId}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            const Gap(10),
                                            Text(
                                              "Order ID: ${serviceList.orderId}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            const Gap(10),
                                            Text(
                                              "Vehicle ID: ${serviceList.vehicleId}",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium,
                                            ),
                                            const Gap(20),
                                            SizedBox(
                                              height: 50,
                                              width: double.infinity,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Text(
                                                    "Status :-",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .titleMedium!
                                                        .copyWith(
                                                            color: Colors.grey),
                                                  ),
                                                  serviceStatus
                                                      ? Text(
                                                          "Completed",
                                                          style: Theme.of(
                                                                  context)
                                                              .textTheme
                                                              .titleMedium!
                                                              .copyWith(
                                                                  color: Colors
                                                                      .green),
                                                        )
                                                      : ElevatedButton(
                                                          style:
                                                              const ButtonStyle(
                                                            elevation:
                                                                WidgetStatePropertyAll(
                                                                    3),
                                                            backgroundColor:
                                                                WidgetStatePropertyAll(
                                                              AppColors
                                                                  .secondaryColor,
                                                            ),
                                                          ),
                                                          onPressed: () {},
                                                          child: Text(
                                                            "Pending",
                                                            style: Theme.of(
                                                                    context)
                                                                .textTheme
                                                                .titleMedium!
                                                                .copyWith(
                                                                    color: Colors
                                                                        .white),
                                                          ),
                                                        ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        }
        return const Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

/*
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../logic/user_service_list_cubit/user_service_list_cubit.dart';
import '../../utils/logger.dart';

class UserServiceList extends StatelessWidget {
  static String routeName = "/UserServiceList";

  const UserServiceList({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserServiceListCubit()..fetchUserFreeServiceListFunction(),
      child: const UserServiceList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: BlocBuilder<UserServiceListCubit, UserServiceListState>(
            builder: (context, state) {
              if (state.userFreeServiceList.isEmpty) {
                return _buildEmptyState(context);
              } else if (state.isLoading) {
                return _buildLoadingState(context);
              } else if (state.isLoaded) {
                return _buildLoadedState(context, state);
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ),
    );
  }


  Widget _buildLoadedState(BuildContext context, UserServiceListState state) {
    return Column(
      children: [
        Text(
          "User Service",
          style: Theme.of(context)
              .textTheme
              .headlineMedium!
              .copyWith(fontSize: 24, fontWeight: FontWeight.w500),
        ),
        const Gap(20),
        Expanded(
          flex: 9,
          child: ListView.builder(
            itemCount: state.userFreeServiceList.length,
            itemBuilder: (context, index) {
              return _buildServiceListItem(context, state, index);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildServiceListItem(
      BuildContext context, UserServiceListState state, int index) {
    final serviceList = state.userFreeServiceList[index];
    final serviceStatus = serviceList.status == 0 ? false : true;
    Log.success(serviceList);
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Dismissible(
        background: const Icon(
          HugeIcons.strokeRoundedDelete01,
          color: Colors.red,
        ),
        direction: DismissDirection.endToStart,
        key: ValueKey(serviceList),
        onDismissed: (direction) {
          state.userFreeServiceList.removeAt(index);
        },
        child: _buildServiceListTile(context, serviceList, serviceStatus),
      ),
    );
  }

  Widget _buildServiceListTile(
      BuildContext context, dynamic serviceList, bool serviceStatus) {
    return Card(
      elevation: 2,
      color: Colors.white,
      child: ListTile(
        title: ExpansionTile(
          backgroundColor: AppColors.primaryColor,
          shape: Border.all(color: Colors.transparent),
          title: Text("Service ID: ${serviceList.id}"),
          children: [
            _buildServiceDetails(context, serviceList, serviceStatus),
          ],
        ),
      ),
    );
  }

  Widget _buildServiceDetails(
      BuildContext context, dynamic serviceList, bool serviceStatus) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "User ID: ${serviceList.userId}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(10),
        Text(
          "Order ID: ${serviceList.orderId}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(10),
        Text(
          "Vehicle ID: ${serviceList.vehicleId}",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const Gap(20),
        _buildServiceStatus(context, serviceStatus),
      ],
    );
  }

  Widget _buildServiceStatus(BuildContext context, bool serviceStatus) {
    return SizedBox(
      height: 50,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Status :-",
            style:
                Theme.of(context).textTheme.titleMedium!.copyWith(color: Colors.grey),
          ),
          serviceStatus
              ? Text(
                  "Completed",
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium!
                      .copyWith(color: Colors.green),
                )
              : ElevatedButton(
                  style: const ButtonStyle(
                    elevation: WidgetStatePropertyAll(3),
                    backgroundColor:
                        WidgetStatePropertyAll(AppColors.secondaryColor),
                  ),
                  onPressed: () {
                    // Handle pending status action
                  },
                  child: Text(
                    "Pending",
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(color: Colors.white),
                  ),
                ),
        ],),
    );
  }
}
 */
