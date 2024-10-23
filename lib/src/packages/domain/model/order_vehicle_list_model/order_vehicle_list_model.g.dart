// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_vehicle_list_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderVehicleListModel _$OrderVehicleListModelFromJson(
        Map<String, dynamic> json) =>
    OrderVehicleListModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      finalPrice: (json['finalPrice'] as num).toInt(),
      itemId: json['itemId'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
      insuranceId: json['insuranceId'] as String,
      paymentId: json['paymentId'] as String,
    );

Map<String, dynamic> _$OrderVehicleListModelToJson(
        OrderVehicleListModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'finalPrice': instance.finalPrice,
      'itemId': instance.itemId,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
      'insuranceId': instance.insuranceId,
      'paymentId': instance.paymentId,
    };
