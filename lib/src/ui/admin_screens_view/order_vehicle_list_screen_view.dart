import 'package:car_dekho_app/src/logic/order_vehicle_list_cubit/order_vehicle_list_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

class OrderVehicleListScreenView extends StatelessWidget {
  static String routeName = "/OrderVehicleListScreenView";

  const OrderVehicleListScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OrderVehicleListCubit()..fetchOrderVehicleListFunction(),
      child: const OrderVehicleListScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderVehicleListCubit, OrderVehicleListState>(
      builder: (context, state) {
        if (state.isLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: SafeArea(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Data will Loading...",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (state.isLogged) {
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
                        "Order List",
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
                          itemCount: state.orderVehicleList!.length,
                          itemBuilder: (context, index) {
                            final orderList = state.orderVehicleList![index];
                            return ExpansionTile(
                              backgroundColor: Colors.grey.withOpacity(0.1),
                              shape: Border.all(color: Colors.transparent),
                              title: Text(
                                orderList.userName,
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Order ID: ${orderList.id}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Gap(10),
                                    Text(
                                      "User ID: ${orderList.userId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Gap(10),
                                    Text(
                                      "Vehicle ID: ${orderList.itemId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Gap(10),
                                    Text(
                                      "Insurance ID: ${orderList.insuranceId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Gap(10),
                                    Text(
                                      "Payment ID: ${orderList.paymentId}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium,
                                    ),
                                    const Gap(10),
                                  ],
                                )
                              ],
                              onExpansionChanged: (value) {},
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
