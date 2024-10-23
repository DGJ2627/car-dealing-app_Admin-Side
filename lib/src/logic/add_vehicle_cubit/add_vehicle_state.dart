part of 'add_vehicle_cubit.dart';

class AddVehicleState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  //final VehicleDataModel? vehicleListModel;

  const AddVehicleState({
    required this.isLogged,
    required this.isLoading,
    // this.vehicleListModel,
  });

  @override
  List<Object> get props => [];

  AddVehicleState copyWith({
    bool? isLogged,
    bool? isLoading,
    // VehicleDataModel? vehicleListModel,
  }) {
    return AddVehicleState(
      isLogged: isLogged ?? this.isLogged,
      isLoading: isLoading ?? this.isLoading,
      // vehicleListModel: vehicleListModel ?? this.vehicleListModel,
    );
  }
}
