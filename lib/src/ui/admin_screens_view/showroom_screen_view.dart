import 'package:car_dekho_app/main.dart';
import 'package:car_dekho_app/src/logic/showroom_list_cubit/showroom_list_cubit.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/showroom_details_screen_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../components/app_custom_dialog_box.dart';
import '../../packages/domain/model/showroom_list_model/showroom_list_model.dart';
import '../../packages/resources/colors.dart';
import 'add_showroom_screen_view.dart';

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
  Widget build(BuildContext context) {
    return BlocBuilder<ShowroomListCubit, ShowroomListState>(
      builder: (context, state) {
        eventBus.on<DeleteShowroomEvent>().listen(
          (event) {
            state.showroomListModel!.removeWhere(
              (element) => element.id == event.showroomModel,
            );
            setState(() {});
          },
        );
        if (state.isLoading) {
          return Scaffold(
            backgroundColor: AppColors.primaryColor,
            body: Center(
              child: Text(
                "Showroom Data is Loading...",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blackColor),
              ),
            ),
          );
        } else if (state.isLogged) {
          final filteredShowroomList = state.showroomListModel!
              .where((showroom) => showroom.status != 2)
              .toList();

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
                        "Showroom",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.blackColor),
                      ),
                      const Gap(20),
                      Expanded(
                        flex: 9,
                        child: ListView.builder(
                          itemCount: filteredShowroomList.length,
                          scrollDirection: Axis.vertical,
                          itemBuilder: (context, index) {
                            final showroomData = filteredShowroomList[index];
                            return filteredShowroomList.isEmpty
                                ? ElevatedButton(
                                    style: const ButtonStyle(
                                      elevation: WidgetStatePropertyAll(3),
                                      backgroundColor: WidgetStatePropertyAll(
                                        AppColors.secondaryColor,
                                      ),
                                    ),
                                    onPressed: () {
                                      Navigator.pushNamed(context,
                                          AddShowroomScreenView.routeName);
                                    },
                                    child: Text(
                                      "Add Showroom Data",
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleLarge!
                                          .copyWith(
                                              color: AppColors.primaryColor),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(bottom: 10),
                                    child: Container(
                                      height: 150,
                                      width: 100,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          border: Border.all(
                                            color: AppColors.secondaryColor,
                                            width: 2,
                                          ),
                                          color: AppColors.primaryColor),
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 10),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Showroom Name:- ${showroomData.showroomName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                          color: AppColors
                                                              .blackColor,
                                                          fontSize: 18),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  "owner Name:- ${showroomData.ownerName}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                ),
                                                const Gap(10),
                                                Text(
                                                  "Location:- ${showroomData.location}",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .titleMedium!
                                                      .copyWith(
                                                        color: AppColors
                                                            .blackColor,
                                                      ),
                                                ),
                                                const Gap(10),
                                              ],
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Container(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .secondaryColor,
                                                        width: 2),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      Navigator.pushNamed(
                                                        context,
                                                        ShowroomDetailsScreenView
                                                            .routeName,
                                                        arguments:
                                                            showroomData.id,
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      HugeIcons
                                                          .strokeRoundedEdit01,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  alignment:
                                                      AlignmentDirectional
                                                          .center,
                                                  height: 40,
                                                  width: 40,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color: AppColors
                                                            .secondaryColor,
                                                        width: 2),
                                                  ),
                                                  child: IconButton(
                                                    onPressed: () {
                                                      AppCustomDialogBox
                                                          .logoutDialog(
                                                        context: context,
                                                        titleName:
                                                            'You want Delete Showroom',
                                                        logoutFunction:
                                                            () async {
                                                          context
                                                              .read<
                                                                  ShowroomListCubit>()
                                                              .deleteShowroomFunction(
                                                                  showroomData
                                                                      .id);
                                                          // state
                                                          //     .showroomListModel!
                                                          //     .removeAt(index);

                                                          eventBus.fire(
                                                              DeleteShowroomEvent(
                                                                  showroomData
                                                                      .id));
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                      );
                                                    },
                                                    icon: const Icon(
                                                      HugeIcons
                                                          .strokeRoundedDelete01,
                                                      size: 22,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
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
        return const Scaffold(body: Center(child: CircularProgressIndicator()));
      },
    );
  }
}

class DeleteShowroomEvent {
  final String showroomModel;

  DeleteShowroomEvent(this.showroomModel);
}
