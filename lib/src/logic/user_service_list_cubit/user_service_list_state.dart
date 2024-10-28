part of 'user_service_list_cubit.dart';

class UserServiceListState extends Equatable {
  final bool isLoaded;
  final bool isLoading;
  final List<UserFreeServiceList> userFreeServiceList;

  const UserServiceListState(
      {required this.isLoaded,
      required this.isLoading,
      required this.userFreeServiceList});

  UserServiceListState copyWith({
    bool? isLoaded,
    bool? isLoading,
    List<UserFreeServiceList>? userFreeServiceList,
  }) {
    return UserServiceListState(
      isLoaded: isLoaded ?? this.isLoaded,
      isLoading: isLoading ?? this.isLoading,
      userFreeServiceList:
          userFreeServiceList ?? List.from(this.userFreeServiceList),
    );
  }

  @override
  List<Object> get props => [isLoaded, isLoading, userFreeServiceList];
}
