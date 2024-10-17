import 'package:json_annotation/json_annotation.dart';

import 'package:equatable/equatable.dart';

part 'showroom_list_model.g.dart';

@JsonSerializable()
class ShowroomListDataModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String showroomName;
  final String ownerName;
  final String licenseNumber;
  final String location;
  final String verificationDocuments;
  final String brand;
  final int status;
  final String admin;
  final DateTime createdAt;
  final DateTime updatedAt;
  @JsonKey(name: '__v')
  final int v;
  final String brandName;

  const ShowroomListDataModel(
      this.id,
      this.showroomName,
      this.ownerName,
      this.licenseNumber,
      this.location,
      this.verificationDocuments,
      this.brand,
      this.status,
      this.admin,
      this.createdAt,
      this.updatedAt,
      this.v,
      this.brandName);

  factory ShowroomListDataModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomListDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomListDataModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        showroomName,
        ownerName,
        licenseNumber,
        location,
        verificationDocuments,
        brand,
        status,
        admin,
        createdAt,
        updatedAt,
        v,
        brand,
      ];

  ShowroomListDataModel copyWith({
    String? id,
    String? showroomName,
    String? ownerName,
    String? licenseNumber,
    String? location,
    String? verificationDocuments,
    String? brand,
    int? status,
    String? admin,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? v,
    String? brandName,
  }) {
    return ShowroomListDataModel(
      id ?? this.id,
      showroomName ?? this.showroomName,
      ownerName ?? this.ownerName,
      licenseNumber ?? this.licenseNumber,
      location ?? this.location,
      verificationDocuments ?? this.verificationDocuments,
      brand ?? this.brand,
      status ?? this.status,
      admin ?? this.admin,
      createdAt ?? this.createdAt,
      updatedAt ?? this.updatedAt,
      v ?? this.v,
      brandName ?? this.brandName,
    );
  }
}
