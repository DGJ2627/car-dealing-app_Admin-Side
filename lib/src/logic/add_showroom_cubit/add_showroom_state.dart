part of 'add_showroom_cubit.dart';

class AddShowroomState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final List<BrandListDataModel>? brandListDataModel;

  const AddShowroomState(
      {this.brandListDataModel,
      required this.isLogged,
      required this.isLoading});

  AddShowroomState copyWith({
    bool? isLogged,
    bool? isLoading,
    List<BrandListDataModel>? brandListDataModel,
  }) {
    return AddShowroomState(
        isLogged: isLogged ?? this.isLogged,
        isLoading: isLoading ?? this.isLoading,
        brandListDataModel: brandListDataModel ?? this.brandListDataModel);
  }

  @override
  List<Object> get props => [
        isLogged,
        isLoading,
      ];
}
