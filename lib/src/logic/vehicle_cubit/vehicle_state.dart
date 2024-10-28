part of 'vehicle_cubit.dart';

class VehicleState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final List<VehicleDataModel> vehicleListModel;
  const VehicleState(
      {required this.isLogged,
      required this.isLoading,
      required this.vehicleListModel});

  VehicleState copyWith({
    bool? isLogged,
    bool? isLoading,
    List<VehicleDataModel>? vehicleListModel,
  }) {
    return VehicleState(
        isLogged: isLogged ?? this.isLogged,
        isLoading: isLoading ?? this.isLoading,
        vehicleListModel: vehicleListModel ?? List.from(this.vehicleListModel));
  }

  @override
  List<Object> get props => [
        isLogged,
        isLoading,
      ];
}
