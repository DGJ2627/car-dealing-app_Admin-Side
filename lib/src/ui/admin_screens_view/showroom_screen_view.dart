import 'package:car_dekho_app/src/logic/showroom_list_cubit/showroom_list_cubit.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/showroom_details_screen_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';

import '../../packages/resources/colors.dart';

class ShowroomScreenView extends StatefulWidget {
  static String routeName = "/ShowroomScreenView";

  const ShowroomScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => ShowroomListCubit()..fetchShowroomListDataFunction(),
      child: const ShowroomScreenView(),
    );
  }

  @override
  State<ShowroomScreenView> createState() => _ShowroomScreenViewState();
}

class _ShowroomScreenViewState extends State<ShowroomScreenView> {
  @override
  void initState() {
    // TODO: implement initState

    context.read<ShowroomListCubit>().fetchShowroomListDataFunction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ShowroomListCubit, ShowroomListState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.primaryColor,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Center(
                child: Column(
                  children: [
                    Text(
                      "Showroom",
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const Gap(20),
                    Expanded(
                      flex: 9,
                      child: ListView.builder(
                        itemCount: state.showroomListModel?.length ?? 0,
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, index) {
                          final showroomData = state.showroomListModel![index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, ShowroomDetailsScreenView.routeName,
                                  arguments: showroomData);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Container(
                                height: 150,
                                width: 100,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: AppColors.secondaryColor,
                                      width: 2,
                                    ),
                                    color: AppColors.primaryColor),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Showroom Name:- ${showroomData.showroomName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                                color: AppColors.blackColor,
                                                fontSize: 18),
                                      ),
                                      const Gap(10),
                                      Text(
                                        "owner Name:- ${showroomData.ownerName}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: AppColors.blackColor,
                                            ),
                                      ),
                                      const Gap(10),
                                      Text(
                                        "Location:- ${showroomData.location}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleMedium!
                                            .copyWith(
                                              color: AppColors.blackColor,
                                            ),
                                      ),
                                      const Gap(10),
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
          // floatingActionButton: Theme(
          //   data: ThemeData(useMaterial3: false),
          //   child: Padding(
          //     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          //     child: FloatingActionButton(
          //       onPressed: () {
          //         Navigator.pushNamed(context, AddShowroomScreenView.routeName);
          //       },
          //       child: const CircleAvatar(
          //         radius: 40,
          //         backgroundColor: AppColors.secondaryColor,
          //         child: Icon(
          //           Icons.add,
          //           color: AppColors.primaryColor,
          //         ),
          //       ),
          //     ),
          //   ),
          // ),
        );
      },
    );
  }
}
