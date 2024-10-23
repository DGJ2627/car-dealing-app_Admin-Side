part of 'home_screen_cubit.dart';

class HomeScreenState extends Equatable {
  final bool isLoggedIn;
  final bool isLoading;
  final AdminDataModel? adminDataModel;
  final String? location;

  const HomeScreenState(
      {required this.isLoggedIn,
      required this.isLoading,
      this.adminDataModel,
      this.location});

  HomeScreenState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    AdminDataModel? adminDataModel,
    final String? location,
  }) {
    return HomeScreenState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoggedIn,
      adminDataModel: adminDataModel ?? this.adminDataModel,
      location: location,
    );
  }

  @override
  List<Object> get props => [isLoggedIn, isLoading];
}
