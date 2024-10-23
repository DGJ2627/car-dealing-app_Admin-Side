part of 'vehicle_details_cubit.dart';

class VehicleDetailsState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final VehicleDetailsModel? vehicleDetailsModel;

  const VehicleDetailsState({
    required this.isLogged,
    required this.isLoading,
    this.vehicleDetailsModel,
  });

  VehicleDetailsState copyWith({
    bool? isLogged,
    bool? isLoading,
    VehicleDetailsModel? vehicleDetailsModel,
  }) {
    return VehicleDetailsState(
      isLogged: isLogged ?? this.isLogged,
      isLoading: isLoading ?? this.isLoading,
      vehicleDetailsModel: vehicleDetailsModel ?? this.vehicleDetailsModel,
    );
  }

  @override
  List<Object> get props => [isLogged, isLoading];
}
