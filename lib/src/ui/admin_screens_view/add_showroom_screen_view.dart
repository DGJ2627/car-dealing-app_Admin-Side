import 'package:car_dekho_app/src/components/app_custom_dialog_box.dart';
import 'package:car_dekho_app/src/logic/add_showroom_cubit/add_showroom_cubit.dart';
import 'package:car_dekho_app/src/packages/domain/model/showroom_add_model/showroom_add_model.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/packages/resources/colors.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';
import 'package:toastification/toastification.dart';

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
        bool isDocument = false;
        final globalKey = GlobalKey<FormState>();
        final showroomNameController = TextEditingController();
        final ownerNameController = TextEditingController();
        final licenseNumberController = TextEditingController();
        final locationNameController = TextEditingController();
        final verificationDocumentsController = TextEditingController();
        final brandNameController = TextEditingController();
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
                      showroomNameController: showroomNameController,
                      ownerNameController: ownerNameController,
                      licenseNumberController: licenseNumberController,
                      locationNameController: locationNameController,
                      verificationDocumentsController:
                          verificationDocumentsController,
                      brandNameController: brandNameController,
                      uploadShowroomDocument: () {
                        context.read<AddShowroomCubit>().uploadDocument(
                            verificationDocumentsController:
                                verificationDocumentsController);
                      },
                      showBrandNameDialog: () {
                        context.read<AddShowroomCubit>().fetchBrandNameList();

                        AppCustomDialogBox.showBrandNameList(
                            context: context,
                            brandListModel: state.brandListDataModel,
                            brandNameController: brandNameController);
                      },
                      sendShowRoomDetails: () async {
                        if (globalKey.currentState!.validate()) {
                          String? documentID =
                              await AppConstants.getUploadDocumentID();
                          String? brandID =
                              await AppConstants.getUploadBrandID();

                          ShowroomDataAddModel showroomModel =
                              ShowroomDataAddModel(
                            showroomName: showroomNameController.text,
                            ownerName: ownerNameController.text,
                            licenseNumber: licenseNumberController.text,
                            location: locationNameController.text,
                            verificationDocuments: documentID!.split('.').first,
                            brand: brandID!,
                          );

                          Log.info(showroomModel);
                          context
                              .read<AddShowroomCubit>()
                              .addShowRoomDetailsFunction(
                                  showroomModel: showroomModel,
                                  context: context);

                          showroomNameController.clear();
                          ownerNameController.clear();
                          licenseNumberController.clear();
                          locationNameController.clear();
                          verificationDocumentsController.clear();
                          brandNameController.clear();
                          AppConstants.clearDocAndBrandName();
                        }
                      },
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
