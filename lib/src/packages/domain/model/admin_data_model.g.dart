// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'admin_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AdminDataModel _$AdminDataModelFromJson(Map<String, dynamic> json) =>
    AdminDataModel(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      contactNumber: (json['contactNumber'] as num).toInt(),
      email: json['email'] as String,
      password: json['password'] as String,
      role: json['role'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
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
