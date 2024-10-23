// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_vehicle_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddVehicleDataModel _$AddVehicleDataModelFromJson(Map<String, dynamic> json) =>
    AddVehicleDataModel(
      showroomId: json['showroomId'] as String,
      carName: json['carName'] as String,
      type: json['type'] as String,
      orignalPrice: (json['orignalPrice'] as num).toInt(),
      warranty: json['warranty'] as String,
      engine: json['engine'] as String,
      power: json['power'] as String,
      photo: json['photo'] as String,
      transMission: json['transMission'] as String,
      mileage: json['mileage'] as String,
      specialfeature: json['specialfeature'] as String,
      fuelType: json['fuelType'] as String,
      insurance: json['insurance'] as String,
      quantity: (json['quantity'] as num).toInt(),
    );

Map<String, dynamic> _$AddVehicleDataModelToJson(
        AddVehicleDataModel instance) =>
    <String, dynamic>{
      'showroomId': instance.showroomId,
      'carName': instance.carName,
      'type': instance.type,
      'orignalPrice': instance.orignalPrice,
      'warranty': instance.warranty,
      'engine': instance.engine,
      'power': instance.power,
      'photo': instance.photo,
      'transMission': instance.transMission,
      'mileage': instance.mileage,
      'specialfeature': instance.specialfeature,
      'fuelType': instance.fuelType,
      'insurance': instance.insurance,
      'quantity': instance.quantity,
    };
