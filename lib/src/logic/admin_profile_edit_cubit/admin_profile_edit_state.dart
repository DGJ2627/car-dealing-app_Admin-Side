part of 'admin_profile_edit_cubit.dart';

class AdminProfileEditState extends Equatable {
  final bool isUpdated;
  final bool isLoading;

  const AdminProfileEditState(
      {required this.isUpdated, required this.isLoading});

  AdminProfileEditState copyWith({
    bool? isUpdated,
    bool? isLoading,
  }) {
    return AdminProfileEditState(
      isUpdated: isUpdated ?? this.isUpdated,
      isLoading: isLoading ?? this.isUpdated,
    );
  }

  @override
  List<Object?> get props => [
        isUpdated,
        isLoading,
      ];
}
