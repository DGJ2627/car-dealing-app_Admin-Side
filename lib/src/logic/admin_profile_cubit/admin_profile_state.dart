part of 'admin_profile_cubit.dart';

sealed class AdminProfileState extends Equatable {
  const AdminProfileState();
}

final class AdminProfileInitial extends AdminProfileState {
  @override
  List<Object> get props => [];
}
