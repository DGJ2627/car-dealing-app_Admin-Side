import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order_vehicle_list_model.g.dart';

@JsonSerializable()
class OrderVehicleListModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final String userName;
  final int finalPrice;
  final String itemId;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: '__v')
  final int v;
  final String insuranceId;
  final String paymentId;

  const OrderVehicleListModel({
    required this.id,
    required this.userId,
    required this.userName,
    required this.finalPrice,
    required this.itemId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
    required this.insuranceId,
    required this.paymentId,
  });

  factory OrderVehicleListModel.fromJson(Map<String, dynamic> json) =>
      _$OrderVehicleListModelFromJson(json);

  Map<String, dynamic> toJson() => _$OrderVehicleListModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        userId,
        userName,
        finalPrice,
        itemId,
        status,
        createdAt,
        updatedAt,
        v,
        insuranceId,
        paymentId,
      ];
}
