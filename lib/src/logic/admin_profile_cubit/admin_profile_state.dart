part of 'admin_profile_cubit.dart';

class AdminProfileState extends Equatable {
  final bool isLoggedIn;
  final bool isLoading;
  final AdminDataModel? adminDataModel;

  const AdminProfileState({
    required this.isLoggedIn,
    required this.isLoading,
    this.adminDataModel,
  });

  AdminProfileState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
    AdminDataModel? adminDataModel,
  }) {
    return AdminProfileState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoggedIn,
      adminDataModel: adminDataModel ?? this.adminDataModel,
    );
  }

  @override
  List<Object> get props => [isLoggedIn, isLoading];
}
