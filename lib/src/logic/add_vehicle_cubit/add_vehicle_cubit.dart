import 'dart:io';

import 'package:car_dekho_app/src/interceptors/admin/admin_interceptors.dart';
import 'package:car_dekho_app/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../../packages/domain/model/vehicle_data_model/vehicle_data_model.dart';
import '../../packages/resources/app_constants.dart';

part 'add_vehicle_state.dart';

class AddVehicleCubit extends Cubit<AddVehicleState> {
  AddVehicleCubit()
      : super(const AddVehicleState(isLogged: false, isLoading: true));

  DioInterceptors dio = DioInterceptors();

  Future<void> addVehicleInShowroomFunction(
      Map<String, dynamic> vehicleMap) async {
    try {
      final response = await dio.post(
          endPoint: ApiEndPoints.addVehiclesData, data: vehicleMap);

      if (response.statusCode == 200) {
        Log.success("VehicleInShowroom Data :- ${response.data}");
      } else {
        Log.info(
            "addVehicleInShowroomFunction Other status Code: -\n ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From Post addVehicleInShowroomFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  Future<void> uploadVehicleImage(
      {required TextEditingController vehicleImageController}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      String fileName = file.path.split('/').last;

      Log.debug("fileName : - $file");

      vehicleImageController.text = fileName;

      final response = await dio.postWithImage(
          endPoint: ApiEndPoints.uploadVehicleImage,
          imageFile: file,
          imageFieldName: 'image');

      try {
        if (response.statusCode == 200) {
          String vehicleImageID = response.data['result'].toString();
          LocalString.uploadVehicleImageID(vehicleImageID);

          //==============================================================//
          String? adminDoc = await LocalString.getUploadVehicleImageID();
          Log.success("Doc :- $adminDoc");
        } else {
          Log.info(
              "Other status Code: - ${response.statusCode} \n ${response.data}");
        }
      } catch (e) {
        Log.error("UploadDocument API :- $e");
        emit(state.copyWith(isLoading: false, isLogged: true));
      }
    } else {
      // Navigator.pop(context);
    }
  }
}
