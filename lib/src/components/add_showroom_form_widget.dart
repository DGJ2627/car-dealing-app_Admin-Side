
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../packages/helper/custom_text_field.dart';
import '../packages/helper/text_field_validator.dart';
import '../packages/resources/colors.dart';

class AddShowroomFormWidget extends StatefulWidget {
  const AddShowroomFormWidget({
    super.key,
    required this.showroomNameController,
    required this.ownerNameController,
    required this.licenseNumberController,
    required this.locationNameController,
    required this.verificationDocumentsController,
    required this.brandNameController,
    required this.globalKey,
    this.showBrandNameDialog,
    this.sendShowRoomDetails,
    this.uploadShowroomDocument,
  });

  final GlobalKey<FormState> globalKey;
  final TextEditingController showroomNameController;
  final TextEditingController ownerNameController;
  final TextEditingController licenseNumberController;
  final TextEditingController locationNameController;
  final TextEditingController verificationDocumentsController;
  final TextEditingController brandNameController;
  final void Function()? showBrandNameDialog;
  final void Function()? sendShowRoomDetails;
  final void Function()? uploadShowroomDocument;

  @override
  State<AddShowroomFormWidget> createState() => _AddShowroomFormWidgetState();
}

class _AddShowroomFormWidgetState extends State<AddShowroomFormWidget> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.globalKey,
      child: Column(
        children: [
          CustomTextField(
            fieldController: widget.showroomNameController,
            fieldName: 'ShowroomName',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) => InputValidator.textFieldValidator(
                FieldType.showroomName, value),
            obscureText: false,
          ),
          const Gap(20),
          CustomTextField(
            fieldController: widget.ownerNameController,
            fieldName: 'OwnerName',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.ownerName, value),
            obscureText: false,
          ),
          const Gap(20),
          CustomTextField(
            fieldController: widget.licenseNumberController,
            fieldName: 'LicenseNumber',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) => InputValidator.textFieldValidator(
                FieldType.licenseNumber, value),
            obscureText: false,
          ),
          const Gap(20),
          CustomTextField(
            fieldController: widget.locationNameController,
            fieldName: 'Location',
            autoFocus: false,
            isReadOnly: false,
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.location, value),
            obscureText: false,
          ),
          const Gap(20),
          CustomTextField(
            fieldController: widget.verificationDocumentsController,
            fieldName: 'VerificationDocuments',
            autoFocus: false,
            isReadOnly: true,
            suffixIcon: IconButton(
                onPressed: widget.uploadShowroomDocument,
                icon: const Icon(HugeIcons.strokeRoundedFileValidation)),
            validator: (value) => InputValidator.textFieldValidator(
                FieldType.verificationDocuments, value),
            obscureText: false,
          ),
          const Gap(20),
          CustomTextField(
            fieldController: widget.brandNameController,
            fieldName: 'BrandName',
            autoFocus: false,
            isReadOnly: true,
            suffixIcon: IconButton(
                onPressed: widget.showBrandNameDialog,
                icon: const Icon(Icons.add)),
            validator: (value) =>
                InputValidator.textFieldValidator(FieldType.brand, value),
            obscureText: false,
          ),
          const Gap(80),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: widget.sendShowRoomDetails,
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

/*

 */
