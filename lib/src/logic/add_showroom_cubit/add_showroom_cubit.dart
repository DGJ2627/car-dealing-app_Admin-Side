import 'dart:io';
import 'package:car_dekho_app/src/packages/domain/model/brand_list_model/brand_list_data.dart';
import 'package:car_dekho_app/src/packages/resources/app_constants.dart';
import 'package:equatable/equatable.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../interceptors/admin/admin_interceptors.dart';
import '../../packages/data/local/shared_preferences/shared_preferences_database.dart';
import '../../packages/domain/model/showroom_add_model/showroom_add_model.dart';
import '../../utils/logger.dart';

part 'add_showroom_state.dart';

class AddShowroomCubit extends Cubit<AddShowroomState> {
  AddShowroomCubit()
      : super(const AddShowroomState(isLogged: false, isLoading: true)) {
    fetchBrandNameList();
  }

  final DioInterceptors dio = DioInterceptors();

  //add showroom data

  Future<void> addShowRoomDetailsFunction(
      {required ShowroomDataAddModel showroomModel,
      required BuildContext context}) async {
    emit(state.copyWith(isLogged: true));
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
        Log.success("ShowRoom Data :- ${response.data}");
      } else if (response.statusCode == 400 || response.statusCode == 422) {
        final responseData = response.data as Map<String, dynamic>;
        if (responseData.containsKey('showroomName')) {
          final errorMessage = responseData['showroomName'] as String;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        } else if (responseData.containsKey('licenseNumber')) {
          final errorMessage = responseData['licenseNumber'] as String;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(errorMessage)),
          );
        }
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
      final deleteShowroomList =
          state.brandListDataModel!.firstWhere((item) => item.id == brandID);

      final response = await dio
          .delete(endPoint: ApiEndPoints.deleteShowroom, queryParameters: {
        'brandId': brandID,
      });

      if (response.statusCode == 200) {
        state.brandListDataModel!.removeWhere((item) => item.id == brandID);

        final index = state.brandListDataModel!.indexOf(deleteShowroomList);
        if (index != -1) {
          state.brandListDataModel![index];
        }

        emit(state.copyWith(
          isLoading: false,
          isLogged: true,
          brandListDataModel: state.brandListDataModel!,
        ));
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
}

/*
class AddShowroomCubit extends Cubit<AddShowroomState> {
  AddShowroomCubit()
      : super(const AddShowroomState(isLogged: false, isLoading: true)) {
    _brandNameListStreamController = StreamController<List<BrandListDataModel>>();
    _brandNameListStream = _brandNameListStreamController.stream;
    fetchBrandNameList();
  }

  final DioInterceptors dio = DioInterceptors();

  late StreamController<List<BrandListDataModel>> _brandNameListStreamController;
  late Stream<List<BrandListDataModel>> _brandNameListStream;

  Stream<List<BrandListDataModel>> get brandNameListStream => _brandNameListStream;

  // ... (other methods) ...

  Future<void> fetchBrandNameList() async {
    try {final response = await dio.get(
        endPoint: ApiEndPoints.showBrandList,
      );
      if (response.statusCode == 200) {
        final brandNameListData = (response.data as List)
            .map((e) => BrandListDataModel.fromJson(e))
            .toList();
        _brandNameListStreamController.add(brandNameListData);
        Log.success("brandNameListData :- $brandNameListData");
      }
    } catch (e) {
      Log.error("Error From Get fetchBrandNameList API :- $e");
      emit(state.copyWith(isLoading: true, isLogged: false));
    }
  }

  // ... (other methods) ...

  @override
  Future<void> close() {
    _brandNameListStreamController.close();
    return super.close();
  }
}


@override
Widget build(BuildContext context) {
  return BlocBuilder<AddShowroomCubit, AddShowroomState>(
    builder: (context, state) {
      // ... (other code) ...

      return Scaffold(
        // ... (other code) ...

        Expanded(
          child: StreamBuilder<List<BrandListDataModel>>(
            stream: context.read<AddShowroomCubit>().brandNameListStream,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return AddShowroomFormWidget(
                  // ... (other parameters) ...
                  brandListModel: snapshot.data!, // Use snapshot.data
                  // ... (other parameters) ...
                );
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          ),
        ),

        // ... (other code) ...
      );
    },
  );
}
 */
