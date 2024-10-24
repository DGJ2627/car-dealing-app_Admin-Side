import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_free_service_list.g.dart';

@JsonSerializable()
class UserFreeServiceList extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String userId;
  final String vehicleId;
  final String orderId;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: '__v')
  final int v;

  const UserFreeServiceList({
    required this.id,
    required this.userId,
    required this.vehicleId,
    required this.orderId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory UserFreeServiceList.fromJson(Map<String, dynamic> json) =>
      _$UserFreeServiceListFromJson(json);

  Map<String, dynamic> toJson() => _$UserFreeServiceListToJson(this);

  UserFreeServiceList copyWith({
    String? id,
    String? userId,
    String? vehicleId,
    String? orderId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return UserFreeServiceList(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      vehicleId: vehicleId ?? this.vehicleId,
      orderId: orderId ?? this.orderId,
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
        orderId,
        status,
        createdAt,
        updatedAt,
        v,
      ];
}
