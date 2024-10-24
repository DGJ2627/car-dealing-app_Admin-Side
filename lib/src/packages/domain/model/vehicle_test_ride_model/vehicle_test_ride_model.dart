import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'vehicle_test_ride_model.g.dart'; // Choose a relevant file name

@JsonSerializable()
class VehicleTestRideModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final String vehicleId;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: '__v')
  final int v;

  const VehicleTestRideModel({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory VehicleTestRideModel.fromJson(Map<String, dynamic> json) =>
      _$VehicleTestRideModelFromJson(json);

  Map<String, dynamic> toJson() => _$VehicleTestRideModelToJson(this);

  VehicleTestRideModel copyWith({
    String? id,
    String? userId,
    String? vehicleId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return VehicleTestRideModel(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      vehicleId: vehicleId ?? this.vehicleId,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props => [
        id,
        userId,
        vehicleId,
        status,
        createdAt,
        updatedAt,
        v,
      ];
}
