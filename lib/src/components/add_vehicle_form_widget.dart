import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hugeicons/hugeicons.dart';

import '../logic/add_vehicle_cubit/add_vehicle_cubit.dart';
import '../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../packages/domain/model/add_vehicle_model/add_vehicle_model.dart';
import '../packages/helper/custom_text_field.dart';
import '../packages/resources/colors.dart';
import '../utils/logger.dart';

class AddVehicleFormWidget extends StatelessWidget {
  const AddVehicleFormWidget({
    super.key,
    required this.globalKey,
    required this.cubit,
    required this.showroomId,
  });

  final GlobalKey<FormState> globalKey;
  final AddVehicleCubit cubit;
  final String showroomId;

  @override
  Widget build(BuildContext context) {
    final showroomController = TextEditingController(text: showroomId);
    final carNameController = TextEditingController();
    final typeController = TextEditingController(text: "0");
    final originalPriceController = TextEditingController();
    final warrantyController = TextEditingController();
    final engineController = TextEditingController();
    final powerController = TextEditingController();
    final photoController = TextEditingController();
    final transMissionController = TextEditingController();
    final mileageController = TextEditingController();
    final specialFeatureController = TextEditingController();
    final fuelTypeController = TextEditingController();
    final insuranceController = TextEditingController();
    final quantityController = TextEditingController();
    final List<Map<String, dynamic>> fields = [
      {
        'fieldController': showroomController,
        'fieldName': 'Showroom Name',
        'autoFocus': false,
        'isReadOnly': true,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': carNameController,
        'fieldName': 'CarName',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': typeController,
        'fieldName': 'Type',
        'autoFocus': false,
        'isReadOnly': true,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': originalPriceController,
        'fieldName': 'originalPrice',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': warrantyController,
        'fieldName': 'warranty',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': engineController,
        'fieldName': 'engine',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': powerController,
        'fieldName': 'power',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': photoController,
        'fieldName': 'photo',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
        'suffixIcon': IconButton(
            onPressed: () {
              cubit.uploadVehicleImage(vehicleImageController: photoController);
            },
            icon: const Icon(HugeIcons.strokeRoundedFileValidation)),
      },
      {
        'fieldController': transMissionController,
        'fieldName': 'transMission',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': mileageController,
        'fieldName': 'mileage',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': specialFeatureController,
        'fieldName': 'specialFeature',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': fuelTypeController,
        'fieldName': 'fuelType',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': insuranceController,
        'fieldName': 'insurance',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
      {
        'fieldController': quantityController,
        'fieldName': 'Quantity',
        'autoFocus': false,
        'isReadOnly': false,
        'validator': (p0) {
          return null;
        },
        'obscureText': false,
      },
    ];

    final fieldMapping = {
      'Showroom Name': 'showroomId',
      'CarName': 'carName',
      'Type': 'type',
      'originalPrice': 'orignalPrice',
      'warranty': 'warranty',
      'engine': 'engine',
      'power': 'power',
      'photo': 'photo',
      'transMission': 'transMission',
      'mileage': 'mileage',
      'specialFeature': 'specialfeature',
      'fuelType': 'fuelType',
      'insurance': 'insurance',
      'Quantity': 'quantity',
    };
    return Form(
      key: globalKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            for (final field in fields)
              Padding(
                padding: const EdgeInsets.only(bottom: 20),
                child: CustomTextField(
                  fieldController:
                      field['fieldController'] as TextEditingController,
                  fieldName: field['fieldName'] as String,
                  autoFocus: field['autoFocus'] as bool,
                  isReadOnly: field['isReadOnly'] as bool,
                  validator: field['validator'] as String? Function(String?)?,
                  obscureText: field['obscureText'] as bool,
                  suffixIcon: field['suffixIcon'] as IconButton?,
                ),
              ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                    String? image = await LocalString.getUploadVehicleImageID();
                    if (globalKey.currentState!.validate()) {
                      final data = AppConstants.extractFormData(
                          fields, fieldMapping, image!.split('.').first);
                      final addVehicleData = AddVehicleDataModel.fromJson(data);
                      Log.debug(addVehicleData);
                      cubit.addVehicleInShowroomFunction(data);
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
      ),
    );
  }
}
