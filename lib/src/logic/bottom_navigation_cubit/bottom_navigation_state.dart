part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int currentIndex;
  final List<Widget> screen = [
    const HomeScreenView(),
    const ShowroomScreenView(),
    const VehicleScreenView(),
    const AdminProfileScreenView(),
  ];
  final List<String> screenName = ["Home", "Showroom", "Vehicle", "Profile"];
  final List screenIcon = [
    HugeIcons.strokeRoundedHome01,
    HugeIcons.strokeRoundedCar01,
    HugeIcons.strokeRoundedMotorbike02,
    HugeIcons.strokeRoundedUser,
  ];

  BottomNavigationState({required this.currentIndex});

  @override
  List<Object> get props => [currentIndex];

  BottomNavigationState copyWith({required int currentIndex}) {
    return BottomNavigationState(currentIndex: currentIndex);
  }
}
