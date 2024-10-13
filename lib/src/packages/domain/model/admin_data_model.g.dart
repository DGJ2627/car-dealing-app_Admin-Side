// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDataModel _$AdminDataModelFromJson(Map<String, dynamic> json) =>
    AdminDataModel(
      json['_id'] as String,
      json['fullName'] as String,
      (json['contactNumber'] as num).toInt(),
      json['email'] as String,
      json['password'] as String,
      json['role'] as String,
      (json['status'] as num).toInt(),
      DateTime.parse(json['createdAt'] as String),
      DateTime.parse(json['updatedAt'] as String),
      (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$AdminDataModelToJson(AdminDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'contactNumber': instance.contactNumber,
      'email': instance.email,
      'password': instance.password,
      'role': instance.role,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
