// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showroom_add_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowroomDataAddModel _$ShowroomDataAddModelFromJson(
        Map<String, dynamic> json) =>
    ShowroomDataAddModel(
      showroomName: json['showroomName'] as String,
      ownerName: json['ownerName'] as String,
      licenseNumber: json['licenseNumber'] as String,
      location: json['location'] as String,
      verificationDocuments: json['verificationDocuments'] as String,
      brand: json['brand'] as String,
    );

Map<String, dynamic> _$ShowroomDataAddModelToJson(
        ShowroomDataAddModel instance) =>
    <String, dynamic>{
      'showroomName': instance.showroomName,
      'ownerName': instance.ownerName,
      'licenseNumber': instance.licenseNumber,
      'location': instance.location,
      'verificationDocuments': instance.verificationDocuments,
      'brand': instance.brand,
    };
