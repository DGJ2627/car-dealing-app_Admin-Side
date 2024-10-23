// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vehicle_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VehicleDataModel _$VehicleDataModelFromJson(Map<String, dynamic> json) =>
    VehicleDataModel(
      id: json['_id'] as String,
      brandName: json['brandName'] as String,
      showroomId: json['showroomId'] as String,
      vehicleName: json['vehicleName'] as String,
      type: (json['type'] as num).toInt(),
      orignalPrice: (json['orignalPrice'] as num).toInt(),
      discountAmount: (json['discountAmount'] as num).toInt(),
      finalPrice: (json['finalPrice'] as num).toInt(),
      insurance: json['insurance'] as String,
      rating: (json['rating'] as num).toInt(),
      stars: (json['stars'] as num).toInt(),
      engine: json['engine'] as String,
      power: json['power'] as String,
      photo: json['photo'] as String,
      transMission: json['transMission'] as String,
      fuelType: json['fuelType'] as String,
      mileage: json['mileage'] as String,
      specialfeature: json['specialfeature'] as String,
      status: (json['status'] as num).toInt(),
      quantity: (json['quantity'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$VehicleDataModelToJson(VehicleDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'brandName': instance.brandName,
      'showroomId': instance.showroomId,
      'vehicleName': instance.vehicleName,
      'type': instance.type,
      'orignalPrice': instance.orignalPrice,
      'discountAmount': instance.discountAmount,
      'finalPrice': instance.finalPrice,
      'insurance': instance.insurance,
      'rating': instance.rating,
      'stars': instance.stars,
      'engine': instance.engine,
      'power': instance.power,
      'photo': instance.photo,
      'transMission': instance.transMission,
      'fuelType': instance.fuelType,
      'mileage': instance.mileage,
      'specialfeature': instance.specialfeature,
      'status': instance.status,
      'quantity': instance.quantity,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
