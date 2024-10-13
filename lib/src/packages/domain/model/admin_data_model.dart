import 'package:json_annotation/json_annotation.dart';

part 'admin_data_model.g.dart';

@JsonSerializable()
class AdminDataModel {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  final int contactNumber;
  final String email;
  final String password;
  final String role;
  final int status;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: '__v')
  final int v;

  AdminDataModel(
      this.id,
      this.fullName,
      this.contactNumber,
      this.email,
      this.password,
      this.role,
      this.status,
      this.createdAt,
      this.updatedAt,
      this.v);

  factory AdminDataModel.fromJson(Map<String, dynamic> json) =>
      _$AdminDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AdminDataModelToJson(this);

  AdminDataModel copyWith({
    String? id,
    String? fullName,
    int? contactNumber,
    String? email,
    String? password,
    String? role,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
  }) {
    return AdminDataModel(
      id ?? this.id,
      fullName ?? this.fullName,
      contactNumber ?? this.contactNumber,
      email ?? this.email,
      password ?? this.password,
      role ?? this.role,
      status ?? this.status,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
      v ?? this.v,
    );
  }
}
