import 'dart:async';
import 'dart:io';
import 'package:car_dekho_app/src/packages/domain/model/brand_list_model/brand_list_data.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:car_dekho_app/src/packages/resources/stream_subscription.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../main.dart';
import '../../interceptors/admin/admin_interceptors.dart';
import '../../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../../packages/domain/model/showroom_add_model/showroom_add_model.dart';
import '../../utils/logger.dart';
import '../showroom_list_cubit/showroom_list_cubit.dart';

part 'add_showroom_state.dart';

class AddShowroomCubit extends Cubit<AddShowroomState>
    with StreamSubscriptionMixin {
  late StreamSubscription _brandName;

  AddShowroomCubit()
      : super(const AddShowroomState(
            isLogged: false, isLoading: true, brandListDataModel: [])) {
    fetchBrandNameList();

    _brandName = eventBus.on<AddBrandNameEvent>().listen(
      (event) {
        fetchBrandNameList();
      },
    );
  }

  final DioInterceptors dio = DioInterceptors();

  //add showroom data

  Future<void> addShowRoomDetailsFunction(
      {required ShowroomDataAddModel showroomModel}) async {
    //emit(state.copyWith(isLogged: true));
    Log.info("ShowRoom Map Send Data :$showroomModel");
    try {
      final response = await dio.post(
        endPoint: ApiEndPoints.addShowroom,
        data: {
          'showroomName': showroomModel.showroomName,
          'ownerName': showroomModel.ownerName,
          'licenseNumber': showroomModel.licenseNumber,
          'location': showroomModel.location,
          'verificationDocuments': showroomModel.verificationDocuments,
          'brand': showroomModel.brand,
        },
      );

      if (response.statusCode == 200) {
        //========================================//
        eventBus.fire(AddShowroomEvent());
        //========================================//
        Log.success("ShowRoom Data :- ${response.data}");
      } else if (response.statusCode == 400 || response.statusCode == 422) {
        Log.info(" ${response.statusCode} \n ${response.data}");
      } else {
        Log.info(
            "addShowRoomDetailsFunction Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From Post addShowRoomDetailsFunction API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  // brandList
  Future<void> fetchBrandNameList() async {
    try {
      final response = await dio.get(
        endPoint: ApiEndPoints.showBrandList,
      );
      if (response.statusCode == 200) {
        final brandNameListData = (response.data as List)
            .map((e) => BrandListDataModel.fromJson(e))
            .toList();
        emit(state.copyWith(
            isLoading: false,
            isLogged: true,
            brandListDataModel: brandNameListData));
        Log.success("brandNameListData :- ${state.brandListDataModel}");
      }
    } catch (e) {
      Log.error("Error From Get fetchBrandNameList API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  // add brand

  Future<void> addBrandName(String brandName) async {
    try {
      final response = await dio.post(
        endPoint: ApiEndPoints.addBrand,
        data: {
          'brandName': brandName,
        },
      );
      if (response.statusCode == 200) {
        Log.success("Add BrandName ${response.data}");
        eventBus.fire(AddBrandNameEvent());
      } else {
        Log.info(
            "addBrandName Other status Code: - ${response.statusCode} \n ${response.data}");
      }
    } catch (e) {
      Log.error("Error From Get addBrandName API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  // filePick

  Future<void> uploadDocument(
      {required TextEditingController verificationDocumentsController}) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'pdf', 'doc', 'png'],
    );

    if (result != null) {
      File file = File(result.files.single.path!);

      String fileName = file.path.split('/').last;

      Log.debug("fileName : - $file");

      verificationDocumentsController.text = fileName;

      final response = await dio.postWithImage(
          endPoint: ApiEndPoints.uploadShowroomDoc,
          imageFile: file,
          imageFieldName: 'image');

      try {
        if (response.statusCode == 200) {
          String documentID = response.data['result'].toString();
          LocalString.uploadDocumentID(documentID);

          //==============================================================//
          String? adminDoc = await LocalString.getUploadDocumentID();
          Log.success("Doc :- $adminDoc");
        } else {
          Log.info(
              "Other status Code: - ${response.statusCode} \n ${response.data}");
        }
      } catch (e) {
        Log.error("UploadDocument API :- $e");
        emit(state.copyWith(isLoading: true, isLogged: false));
      }
    } else {
      //Navigator.pop(context);
    }
  }

  Future<void> deleteBrandListFunction(String? brandID) async {
    try {
      final response = await dio
          .delete(endPoint: ApiEndPoints.deleteBrand, queryParameters: {
        'brandId': brandID,
      });

      if (response.statusCode == 200) {
        final updatedBrandList = state.brandListDataModel
            .where((element) => element.id != brandID)
            .toList();
        emit(state.copyWith(brandListDataModel: updatedBrandList));
      } else {
        Log.info(
            "deleteBrandListFunction Other status Code: -\n ${response.statusCode} \n ${response.data}");
      }
      emit(state.copyWith(
        isLoading: false,
        isLogged: true,
      ));
    } catch (e) {
      Log.error("deleteBrandListFunction :- $e");
      Log.error("deleteBrandListFunction :- ${e.toString()}");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  @override
  Future<void> close() {
    _brandName.cancel();
    return super.close();
  }
}

class AddBrandNameEvent {
  AddBrandNameEvent();
}
