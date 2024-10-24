part of 'vehicle_test_ride_cubit.dart';

class VehicleTestRideState extends Equatable {
  final bool isLoaded;
  final bool isLoading;
  final List<VehicleTestRideModel>? vehicleTestRideList;
  const VehicleTestRideState(
      {required this.isLoaded,
      required this.isLoading,
      this.vehicleTestRideList});

  VehicleTestRideState copyWith({
    bool? isLoaded,
    bool? isLoading,
    List<VehicleTestRideModel>? vehicleTestRideList,
  }) {
    return VehicleTestRideState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      vehicleTestRideList: vehicleTestRideList ?? this.vehicleTestRideList,
    );
  }

  @override
  List<Object> get props => [
        isLoaded,
        isLoading,
      ];
}
