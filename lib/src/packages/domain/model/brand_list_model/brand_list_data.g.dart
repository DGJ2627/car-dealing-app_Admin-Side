// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'brand_list_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BrandListDataModel _$BrandListDataModelFromJson(Map<String, dynamic> json) =>
    BrandListDataModel(
      id: json['_id'] as String,
      brandName: json['brandName'] as String,
      admin: json['admin'] as String,
      status: (json['status'] as num).toInt(),
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      v: (json['__v'] as num).toInt(),
    );

Map<String, dynamic> _$BrandListDataModelToJson(BrandListDataModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'brandName': instance.brandName,
      'admin': instance.admin,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      '__v': instance.v,
    };
