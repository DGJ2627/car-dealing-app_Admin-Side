part of 'order_vehicle_list_cubit.dart';

class OrderVehicleListState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final List<OrderVehicleListModel>? orderVehicleList;
  const OrderVehicleListState(
      {required this.isLogged, required this.isLoading, this.orderVehicleList});

  OrderVehicleListState copyWith({
    bool? isLogged,
    bool? isLoading,
    List<OrderVehicleListModel>? orderVehicleList,
  }) {
    return OrderVehicleListState(
        isLogged: isLogged ?? this.isLogged,
        isLoading: isLoading ?? this.isLoading,
        orderVehicleList: orderVehicleList ?? this.orderVehicleList);
  }

  @override
  List<Object> get props => [
        isLogged,
        isLoading,
      ];
}
