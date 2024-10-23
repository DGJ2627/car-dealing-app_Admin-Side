import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_vehicle_model.g.dart'; // This line is important for code generation

@JsonSerializable()
class AddVehicleDataModel extends Equatable {
  final String showroomId;
  final String carName;
  final String type;
  final int orignalPrice;
  final String warranty;
  final String engine;
  final String power;
  final String photo;
  final String transMission;
  final String mileage;
  final String specialfeature;
  final String fuelType;
  final String insurance;
  final int quantity;
  const AddVehicleDataModel(
      {required this.showroomId,
      required this.carName,
      required this.type,
      required this.orignalPrice,
      required this.warranty,
      required this.engine,
      required this.power,
      required this.photo,
      required this.transMission,
      required this.mileage,
      required this.specialfeature,
      required this.fuelType,
      required this.insurance,
      required this.quantity});

  factory AddVehicleDataModel.fromJson(Map<String, dynamic> json) =>
      _$AddVehicleDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$AddVehicleDataModelToJson(this);

  @override
  List<Object?> get props => [
        showroomId,
        carName,
        type,
        orignalPrice,
        warranty,
        engine,
        power,
        photo,
        transMission,
        mileage,
        specialfeature,
        fuelType,
        insurance,
        quantity,
      ];
}
