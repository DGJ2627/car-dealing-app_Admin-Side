import 'package:car_dekho_app/src/logic/home_screen_cubit/home_screen_cubit.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/user_document_verify_screen_view.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/user_service_list.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/vehicle_test_ride_screen_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:iconsax/iconsax.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../components/other_services_widget.dart';
import '../../packages/helper/custom_search_delegate.dart';
import 'order_vehicle_list_screen_view.dart';

class HomeScreenView extends StatelessWidget {
  static String routeName = "/HomeScreenView";

  const HomeScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeScreenCubit(),
      child: const HomeScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenCubit, HomeScreenState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          height: 40,
                          width: 130,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: AppColors.secondaryColor,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Gap(6),
                              Container(
                                alignment: AlignmentDirectional.center,
                                height: 30,
                                width: 30,
                                decoration: const BoxDecoration(
                                  color: AppColors.primaryColor,
                                  shape: BoxShape.circle,
                                ),
                                child: const HugeIcon(
                                    icon: HugeIcons.strokeRoundedLocation01,
                                    color: AppColors.blackColor),
                              ),
                              const Gap(4),
                              Text(
                                state.location?.isEmpty ?? true
                                    ? "Loading"
                                    : state.location!,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: AppColors.primaryColor),
                              ),
                            ],
                          ),
                        ),
                      ),
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.secondaryColor,
                        child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Iconsax.notification,
                                color: AppColors.primaryColor)),
                      ),
                    ],
                  ),
                  const Gap(20),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          showSearch(
                            context: context,
                            delegate: CustomSearchDelegate(),
                          );
                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.1),
                            boxShadow: const [
                              BoxShadow(
                                  spreadRadius: 2,
                                  color: Colors.white,
                                  blurRadius: 10),
                            ],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(HugeIcons.strokeRoundedSearch01),
                                Icon(HugeIcons.strokeRoundedMic01),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  CarouselSlider(
                    options: CarouselOptions(
                      height: 140.0,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 3),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                    ),
                    items: [1, 2, 3, 4, 5].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(10),
                            ),
                          );
                        },
                      );
                    }).toList(),
                  ),
                  const Gap(10),
                  Center(
                    child: SizedBox(
                      height: 10,
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [1, 2, 3, 4, 5].asMap().entries.map((entry) {
                          return Container(
                            height: 10,
                            width: 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.red,
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                  const Gap(20),
                  Expanded(
                    child: GridView(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                              childAspectRatio: 1),
                      children: [
                        // order list
                        OtherServicesWidget(
                          titleName: 'Order Vehicle List',
                          icon: HugeIcons.strokeRoundedBorderFull,
                          onTap: () {
                            Navigator.pushNamed(
                                context, OrderVehicleListScreenView.routeName);
                          },
                        ),

                        //vehicle service
                        OtherServicesWidget(
                            titleName: 'Vehicle Service',
                            icon: HugeIcons.strokeRoundedCustomerService01,
                            onTap: () {
                              Navigator.pushNamed(
                                  context, UserServiceList.routeName);
                            }),

                        //Document verify
                        OtherServicesWidget(
                          titleName: 'User Document verify',
                          icon: HugeIcons.strokeRoundedFileSecurity,
                          onTap: () {
                            Navigator.pushNamed(context,
                                UserDocumentVerifyScreenView.routeName);
                          },
                        ),

                        //Test Ride
                        OtherServicesWidget(
                          titleName: 'User Test Ride',
                          icon: HugeIcons.strokeRoundedMotorbike02,
                          onTap: () {
                            Navigator.pushNamed(
                                context, VehicleTestRideScreenView.routeName);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
