// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_document_verify_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserDocumentVerifyModel _$UserDocumentVerifyModelFromJson(
        Map<String, dynamic> json) =>
    UserDocumentVerifyModel(
      id: json['_id'] as String,
      fullName: json['fullName'] as String,
      userName: json['userName'] as String,
      email: json['email'] as String,
      contactNumber: (json['contactNumber'] as num).toInt(),
      referalId: json['referalId'] as String,
      password: json['password'] as String,
      documentVerification: (json['documentVerification'] as num).toInt(),
      confirmPassword: json['confirmPassword'] as String,
      otp: (json['otp'] as num).toInt(),
      status: (json['status'] as num).toInt(),
      authStatus: (json['authStatus'] as num).toInt(),
      secret: json['secret'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$UserDocumentVerifyModelToJson(
        UserDocumentVerifyModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'fullName': instance.fullName,
      'userName': instance.userName,
      'email': instance.email,
      'contactNumber': instance.contactNumber,
      'referalId': instance.referalId,
      'password': instance.password,
      'documentVerification': instance.documentVerification,
      'confirmPassword': instance.confirmPassword,
      'otp': instance.otp,
      'status': instance.status,
      'authStatus': instance.authStatus,
      'secret': instance.secret,
      '__v': instance.v,
    };
