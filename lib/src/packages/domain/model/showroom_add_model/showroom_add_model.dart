import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'showroom_add_model.g.dart';

@JsonSerializable()
class ShowroomDataAddModel extends Equatable {
  final String showroomName;

  final String ownerName;

  final String licenseNumber;

  final String location;
  final String verificationDocuments;

  final String brand;

  const ShowroomDataAddModel({
    required this.showroomName,
    required this.ownerName,
    required this.licenseNumber,
    required this.location,
    required this.verificationDocuments,
    required this.brand,
  });

  factory ShowroomDataAddModel.fromJson(Map<String, dynamic> json) =>
      _$ShowroomDataAddModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShowroomDataAddModelToJson(this);

  @override
  List<Object?> get props => [
        showroomName,
        ownerName,
        licenseNumber,
        location,
        verificationDocuments,
        brand,
      ];
}
