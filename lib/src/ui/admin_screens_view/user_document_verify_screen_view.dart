import 'package:car_dekho_app/src/logic/user_document_verify_cubit/user_document_verify_cubit.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import '../../components/app_custom_dialog_box.dart';
import '../../packages/resources/colors.dart';

class UserDocumentVerifyScreenView extends StatelessWidget {
  static String routeName = "/UserDocumentVerifyScreenView";

  const UserDocumentVerifyScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          UserDocumentVerifyCubit()..fetchUserDocumentForVerificationFunction(),
      child: const UserDocumentVerifyScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDocumentVerifyCubit, UserDocumentVerifyState>(
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
                        "Document Verification List",
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
                          itemCount: state.userDocumentList!.length,
                          itemBuilder: (context, index) {
                            final orderList = state.userDocumentList![index];
                            Log.success(orderList);
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: Dismissible(
                                background: const Icon(
                                  HugeIcons.strokeRoundedDelete01,
                                  color: Colors.red,
                                ),
                                direction: DismissDirection.endToStart,
                                key: ValueKey(orderList),
                                onDismissed: (direction) {
                                  state.userDocumentList!.removeAt(index);
                                },
                                child: Card(
                                  elevation: 2,
                                  color: Colors.white,
                                  child: ListTile(
                                    title: Text(orderList.userName),
                                    trailing: (orderList.documentVerification ==
                                            1)
                                        ? Text(
                                            "Approved",
                                            style: Theme.of(context)
                                                .textTheme
                                                .titleMedium!
                                                .copyWith(color: Colors.green),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              AppCustomDialogBox
                                                  .userDocumentVerifyDialog(
                                                context: context,
                                                titleName:
                                                    'Document Verification',
                                                approveFunction: () {
                                                  context
                                                      .read<
                                                          UserDocumentVerifyCubit>()
                                                      .userDocumentVerificationFunction(
                                                          orderList.id);
                                                  Navigator.pop(context);
                                                },
                                              );
                                            },
                                            child: Text(
                                              "Pending",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .titleMedium!
                                                  .copyWith(
                                                      color: Colors.amber),
                                            ),
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
          body: Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
