// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_test_ride_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleTestRideModel _$VehicleTestRideModelFromJson(
        Map<String, dynamic> json) =>
    VehicleTestRideModel(
      id: json['_id'] as String,
      userId: json['userId'] as String,
      vehicleId: json['vehicleId'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$VehicleTestRideModelToJson(
        VehicleTestRideModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'userId': instance.userId,
      'vehicleId': instance.vehicleId,
      'status': instance.status,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      '__v': instance.v,
    };
