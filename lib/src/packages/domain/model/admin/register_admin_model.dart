import 'package:json_annotation/json_annotation.dart';

part 'register_admin_model.g.dart';

@JsonSerializable()
class RegisterAdminModel {
  String password;
  String email;
  String contactNumber;
  String fullName;

  RegisterAdminModel({
    required this.password,
    required this.email,
    required this.contactNumber,
    required this.fullName,
  });

  factory RegisterAdminModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterAdminModelFromJson(json);

  Map<String, dynamic> toMap() => _$RegisterAdminModelToJson(this);

  RegisterAdminModel copyWith({
    String? password,
    String? email,
    String? contactNumber,
    String? fullName,
  }) {
    return RegisterAdminModel(
      password: password ?? this.password,
      email: email ?? this.email,
      contactNumber: contactNumber ?? this.contactNumber,
      fullName: fullName ?? this.fullName,
    );
  }
}
