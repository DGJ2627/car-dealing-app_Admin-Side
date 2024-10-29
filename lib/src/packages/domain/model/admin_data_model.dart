import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'admin_data_model.g.dart';

@JsonSerializable()
class AdminDataModel extends Equatable {
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

  const AdminDataModel(
      {required this.id,
      required this.fullName,
      required this.contactNumber,
      required this.email,
      required this.password,
      required this.role,
      required this.status,
      required this.createdAt,
      required this.updatedAt,
      required this.v});

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
      id: id ?? this.id,
      fullName: fullName ?? this.fullName,
      contactNumber: contactNumber ?? this.contactNumber,
      email: email ?? this.email,
      password: password ?? this.password,
      role: role ?? this.role,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      v: v ?? this.v,
    );
  }

  @override
  List<Object?> get props => [
        id,
        fullName,
        contactNumber,
        email,
        password,
        role,
        status,
        createdAt,
        updatedAt,
        v,
      ];
}
