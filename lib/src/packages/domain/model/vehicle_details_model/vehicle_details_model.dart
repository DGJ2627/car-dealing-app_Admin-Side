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

  VehicleDetailsModel copyWith({
    String? id,
    String? brandName,
    String? showroomId,
    String? adminId,
    String? vehicleName,
    int? type,
    int? orignalPrice,
    int? discountAmount,
    int? finalPrice,
    String? insurance,
    int? rating,
    int? stars,
    String? engine,
    String? power,
    String? photo,
    String? transMission,
    String? fuelType,
    String? mileage,
    String? specialfeature,
    int? status,
    int? quantity,
    String? createdAt,
    String? updatedAt,
    int? v,
  }) {
    return VehicleDetailsModel(
      id: id ?? this.id,
      brandName: brandName ?? this.brandName,
      showroomId: showroomId ?? this.showroomId,
      adminId: adminId ?? this.adminId,
      vehicleName: vehicleName ?? this.vehicleName,
      type: type ?? this.type,
      orignalPrice: orignalPrice ?? this.orignalPrice,
      discountAmount: discountAmount ?? this.discountAmount,
      finalPrice: finalPrice ?? this.finalPrice,
      insurance: insurance ?? this.insurance,
      rating: rating ?? this.rating,
      stars: stars ?? this.stars,
      engine: engine ?? this.engine,
      power: power ?? this.power,
      photo: photo ?? this.photo,
      transMission: transMission ?? this.transMission,
      fuelType: fuelType ?? this.fuelType,
      mileage: mileage ?? this.mileage,
      specialfeature: specialfeature ?? this.specialfeature,
      status: status ?? this.status,
      quantity: quantity ?? this.quantity,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

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
