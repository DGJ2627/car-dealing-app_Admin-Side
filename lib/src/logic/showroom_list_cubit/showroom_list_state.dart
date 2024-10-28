part of 'showroom_list_cubit.dart';

class ShowroomListState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final List<ShowroomListDataModel> showroomListModel;

  const ShowroomListState(
      {required this.isLogged,
      required this.isLoading,
      required this.showroomListModel});

  ShowroomListState copyWith({
    bool? isLogged,
    bool? isLoading,
    List<ShowroomListDataModel>? showroomListModel,
  }) {
    return ShowroomListState(
        isLogged: isLogged ?? this.isLogged,
        isLoading: isLoading ?? this.isLoading,
        showroomListModel:
            showroomListModel ?? List.from(this.showroomListModel));
  }

  @override
  List<Object> get props => [
        isLogged,
        isLoading,
        showroomListModel,
      ];
}
