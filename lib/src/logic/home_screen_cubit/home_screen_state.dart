part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final bool isLoggedIn;
  final bool isLoading;
  final AdminDataModel? adminDataModel;

  const HomeScreenState(
      {required this.isLoggedIn, required this.isLoading, this.adminDataModel});

  HomeScreenState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    AdminDataModel? adminDataModel,
  }) {
    return HomeScreenState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoggedIn,
      adminDataModel: adminDataModel ?? this.adminDataModel,
    );
  }

  @override
  List<Object> get props => [isLoggedIn, isLoading];
}
