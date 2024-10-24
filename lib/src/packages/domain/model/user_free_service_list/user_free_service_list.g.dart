// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_free_service_list.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserFreeServiceList _$UserFreeServiceListFromJson(Map<String, dynamic> json) =>
    UserFreeServiceList(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      vehicleId: json['vehicleId'] as String,
      orderId: json['orderId'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$UserFreeServiceListToJson(
        UserFreeServiceList instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
      'orderId': instance.orderId,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
