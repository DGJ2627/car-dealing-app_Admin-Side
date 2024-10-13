// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterAdminModel _$RegisterAdminModelFromJson(Map<String, dynamic> json) =>
    RegisterAdminModel(
      password: json['password'] as String,
      email: json['email'] as String,
      contactNumber: json['contactNumber'] as String,
      fullName: json['fullName'] as String,
    );

Map<String, dynamic> _$RegisterAdminModelToJson(RegisterAdminModel instance) =>
    <String, dynamic>{
      'password': instance.password,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'fullName': instance.fullName,
    };
