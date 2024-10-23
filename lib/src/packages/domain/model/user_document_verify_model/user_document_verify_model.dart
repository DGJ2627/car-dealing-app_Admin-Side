import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_document_verify_model.g.dart';

@JsonSerializable()
class UserDocumentVerifyModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final String fullName;
  final String userName;
  final String email;
  final int contactNumber;
  final String referalId;
  final String password;
  final int documentVerification;
  final String confirmPassword;
  final int otp;
  final int status;
  final int authStatus;
  final String secret;
  @JsonKey(name: '__v')
  final int v;

  const UserDocumentVerifyModel({
    required this.id,
    required this.fullName,
    required this.userName,
    required this.email,
    required this.contactNumber,
    required this.referalId,
    required this.password,
    required this.documentVerification,
    required this.confirmPassword,
    required this.otp,
    required this.status,
    required this.authStatus,
    required this.secret,
    required this.v,
  });

  factory UserDocumentVerifyModel.fromJson(Map<String, dynamic> json) =>
      _$UserDocumentVerifyModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserDocumentVerifyModelToJson(this);

  @override
  List<Object?> get props => [
        id,
        fullName,
        userName,
        email,
        contactNumber,
        referalId,
        password,
        documentVerification,
        confirmPassword,
        otp,
        status,
        authStatus,
        secret,
        v,
      ];
}
