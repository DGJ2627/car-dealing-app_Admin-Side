import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'brand_list_data.g.dart';

@JsonSerializable()
class BrandListDataModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;

  final String brandName;

  final String admin;

  final int status;

  final String createdAt;

  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  const BrandListDataModel({
    required this.id,
    required this.brandName,
    required this.admin,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory BrandListDataModel.fromJson(Map<String, dynamic> json) =>
      _$BrandListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$BrandListDataModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        brandName,
        admin,
        status,
        createdAt,
        updatedAt,
        v,
      ];
}
