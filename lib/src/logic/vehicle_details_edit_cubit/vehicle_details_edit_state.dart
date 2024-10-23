part of 'vehicle_details_edit_cubit.dart';

class VehicleDetailsEditState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final VehicleDetailsModel? vehicleDetailsModel;

  const VehicleDetailsEditState({
    required this.isLogged,
    required this.isLoading,
    this.vehicleDetailsModel,
  });

  VehicleDetailsEditState copyWith({
    bool? isLogged,
    bool? isLoading,
    VehicleDetailsModel? vehicleDetailsModel,
  }) {
    return VehicleDetailsEditState(
      isLogged: isLogged ?? this.isLogged,
      isLoading: isLoading ?? this.isLoading,
      vehicleDetailsModel: vehicleDetailsModel ?? this.vehicleDetailsModel,
    );
  }

  @override
  List<Object> get props => [isLogged, isLoading];
}
