part of 'showroom_details_cubit.dart';

class ShowroomDetailsState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final ShowroomListDataModel? showroomListModel;

  const ShowroomDetailsState(
      {required this.isLogged,
      required this.isLoading,
      this.showroomListModel});

  ShowroomDetailsState copyWith({
    bool? isLogged,
    bool? isLoading,
    ShowroomListDataModel? showroomListModel,
  }) {
    return ShowroomDetailsState(
        isLogged: isLogged ?? this.isLogged,
        isLoading: isLoading ?? this.isLoading,
        showroomListModel: showroomListModel ?? this.showroomListModel);
  }

  @override
  List<Object> get props => [
        isLogged,
        isLoading,
      ];
}
