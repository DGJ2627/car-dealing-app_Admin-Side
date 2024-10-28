import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../main.dart';
import '../logic/add_showroom_cubit/add_showroom_cubit.dart';
import '../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../packages/domain/model/showroom_add_model/showroom_add_model.dart';
import '../packages/helper/custom_text_field.dart';
import '../packages/helper/text_field_validator.dart';
import '../packages/resources/colors.dart';
import '../utils/logger.dart';
import 'app_custom_dialog_box.dart';

class AddShowroomFormWidget extends StatefulWidget {
  const AddShowroomFormWidget({
    super.key,
    required this.globalKey,
    required this.cubit,
  });

  final GlobalKey<FormState> globalKey;
  final AddShowroomCubit cubit;

  @override
  State<AddShowroomFormWidget> createState() => _AddShowroomFormWidgetState();
}

class _AddShowroomFormWidgetState extends State<AddShowroomFormWidget> {
  @override
  Widget build(BuildContext context) {
    final showroomNameController = TextEditingController();
    final ownerNameController = TextEditingController();
    final licenseNumberController = TextEditingController();
    final locationNameController = TextEditingController();
    final verificationDocumentsController = TextEditingController();
    final brandNameController = TextEditingController();
    return Form(
      key: widget.globalKey,
      child: Column(
        children: [
          //show name
          CustomTextField(
            fieldController: showroomNameController,
            fieldName: 'ShowroomName',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) => InputValidator.textFieldValidator(
                FieldType.showroomName, value),
            obscureText: false,
          ),
          const Gap(20),

          // owner name
          CustomTextField(
            fieldController: ownerNameController,
            fieldName: 'OwnerName',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.ownerName, value),
            obscureText: false,
          ),
          const Gap(20),

          //license no
          CustomTextField(
            fieldController: licenseNumberController,
            fieldName: 'LicenseNumber',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) => InputValidator.textFieldValidator(
                FieldType.licenseNumber, value),
            obscureText: false,
          ),
          const Gap(20),

          //location
          CustomTextField(
            fieldController: locationNameController,
            fieldName: 'Location',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.location, value),
            obscureText: false,
          ),
          const Gap(20),

          //verification
          CustomTextField(
            fieldController: verificationDocumentsController,
            fieldName: 'VerificationDocuments',
            autoFocus: false,
            isReadOnly: true,
            suffixIcon: IconButton(
                onPressed: () {
                  widget.cubit.uploadDocument(
                      verificationDocumentsController:
                          verificationDocumentsController);
                },
                icon: const Icon(HugeIcons.strokeRoundedFileValidation)),
            validator: (value) => InputValidator.textFieldValidator(
                FieldType.verificationDocuments, value),
            obscureText: false,
          ),
          const Gap(20),

          //brand name
          CustomTextField(
            fieldController: brandNameController,
            fieldName: 'BrandName',
            autoFocus: false,
            isReadOnly: true,
            suffixIcon: IconButton(
                onPressed: () async {
                  final addBrandNameController = TextEditingController();
                  // widget.cubit.fetchBrandNameList();

                  if (context.mounted) {
                    AppCustomDialogBox.showBrandNameList(
                      cubit: widget.cubit,
                      titleName: "Select Brand Name",
                      context: context,
                      brandNameController: brandNameController,
                      addBrandNameController: addBrandNameController,
                    );
                  }
                },
                icon: const Icon(Icons.add)),
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.brand, value),
            obscureText: false,
          ),
          const Gap(80),

          // save btn
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () async {
                  if (widget.globalKey.currentState!.validate()) {
                    String? documentID =
                        await LocalString.getUploadDocumentID();
                    String? brandID = await LocalString.getUploadBrandID();

                    ShowroomDataAddModel showroomModel = ShowroomDataAddModel(
                      showroomName: showroomNameController.text,
                      ownerName: ownerNameController.text,
                      licenseNumber: licenseNumberController.text,
                      location: locationNameController.text,
                      verificationDocuments: documentID!.split('.').first,
                      brand: brandID!,
                    );

                    Log.info("ADD Showroom Model::$showroomModel");

                    widget.cubit.addShowRoomDetailsFunction(
                      showroomModel: showroomModel,
                    );

                    showroomNameController.clear();
                    ownerNameController.clear();
                    licenseNumberController.clear();
                    locationNameController.clear();
                    verificationDocumentsController.clear();
                    brandNameController.clear();
                    LocalString.clearDocAndBrandName();
                  }
                },
                style: const ButtonStyle(
                  elevation: WidgetStatePropertyAll(1),
                  backgroundColor: WidgetStatePropertyAll(
                    AppColors.secondaryColor,
                  ),
                ),
                child: Text(
                  "Save",
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: AppColors.primaryColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 18,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DeleteBrandNameEvent {
  final String brandId;

  DeleteBrandNameEvent(this.brandId);
}

void addBrandNameBottomSheet(
    BuildContext context,
    AddShowroomCubit cubit,
    String? Function(String?)? validator,
    TextEditingController fieldController) {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 16,
          right: 16,
          top: 16,
        ),
        child: Form(
          key: globalKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Add Brand Name",
                style: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: AppColors.blackColor),
              ),
              const Gap(20),
              CustomTextField(
                fieldController: fieldController,
                fieldName: 'Add Brand Name',
                autoFocus: false,
                isReadOnly: false,
                validator: validator,
                obscureText: false,
              ),
              const Gap(20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      if (globalKey.currentState!.validate()) {
                        cubit.addBrandName(fieldController.text);
                        eventBus.fire(AddBrandNameEvent());
                        Navigator.pop(context);
                      }
                    },
                    style: const ButtonStyle(
                      elevation: WidgetStatePropertyAll(1),
                      backgroundColor: WidgetStatePropertyAll(
                        AppColors.secondaryColor,
                      ),
                    ),
                    child: Text(
                      "Save",
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                          ),
                    ),
                  ),
                ),
              ),
              const Gap(20),
            ],
          ),
        ),
      );
    },
  );
}
