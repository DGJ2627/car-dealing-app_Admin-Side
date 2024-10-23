import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_details_model.g.dart';

@JsonSerializable()
class VehicleDetailsModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String brandName;
  final String showroomId;
  final String adminId;
  final String vehicleName;
  final int type;
  final int orignalPrice;
  final int discountAmount;
  final int finalPrice;
  final String insurance;
  final int rating;
  final int stars;
  final String engine;
  final String power;
  final String photo;
  final String transMission;
  final String fuelType;
  final String mileage;
  final String specialfeature;
  final int status;
  final int quantity;
  final String createdAt;
  final String updatedAt;
  @JsonKey(name: '__v')
  final int v;

  const VehicleDetailsModel({
    required this.id,
    required this.brandName,
    required this.showroomId,
    required this.adminId,
    required this.vehicleName,
    required this.type,
    required this.orignalPrice,
    required this.discountAmount,
    required this.finalPrice,
    required this.insurance,
    required this.rating,
    required this.stars,
    required this.engine,
    required this.power,
    required this.photo,
    required this.transMission,
    required this.fuelType,
    required this.mileage,
    required this.specialfeature,
    required this.status,
    required this.quantity,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory VehicleDetailsModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleDetailsModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleDetailsModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        brandName,
        showroomId,
        vehicleName,
        type,
        orignalPrice,
        discountAmount,
        finalPrice,
        insurance,
        rating,
        stars,
        engine,
        power,
        photo,
        transMission,
        fuelType,
        mileage,
        specialfeature,
        status,
        quantity,
        createdAt,
        updatedAt,
        v,
      ];
}
