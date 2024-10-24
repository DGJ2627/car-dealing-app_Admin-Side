part of 'user_service_list_cubit.dart';

class UserServiceListState extends Equatable {
  final bool isLoaded;
  final bool isLoading;
  final List<UserFreeServiceList>? userFreeServiceList;

  const UserServiceListState(
      {required this.isLoaded,
      required this.isLoading,
      this.userFreeServiceList});

  UserServiceListState copyWith({
    bool? isLoaded,
    bool? isLoading,
    List<UserFreeServiceList>? userFreeServiceList,
  }) {
    return UserServiceListState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      userFreeServiceList: userFreeServiceList ?? this.userFreeServiceList,
    );
  }

  @override
  List<Object> get props => [
        isLoaded,
        isLoading,
      ];
}
