// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'showroom_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowroomListDataModel _$ShowroomListDataModelFromJson(
        Map<String, dynamic> json) =>
    ShowroomListDataModel(
      json['_id'] as String,
      json['showroomName'] as String,
      json['ownerName'] as String,
      json['licenseNumber'] as String,
      json['location'] as String,
      json['verificationDocuments'] as String,
      json['brand'] as String,
      (json['status'] as num).toInt(),
      json['admin'] as String,
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      (json['__v'] as num).toInt(),
      json['brandName'] as String,
    );

Map<String, dynamic> _$ShowroomListDataModelToJson(
        ShowroomListDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'showroomName': instance.showroomName,
      'ownerName': instance.ownerName,
      'licenseNumber': instance.licenseNumber,
      'location': instance.location,
      'verificationDocuments': instance.verificationDocuments,
      'brand': instance.brand,
      'status': instance.status,
      'admin': instance.admin,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
      'brandName': instance.brandName,
    };
