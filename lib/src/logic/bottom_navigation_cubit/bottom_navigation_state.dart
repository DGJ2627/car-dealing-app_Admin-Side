part of 'bottom_navigation_cubit.dart';

class BottomNavigationState extends Equatable {
  final int currentIndex;
  final List<Widget> screen = [
    const HomeScreenView(),
    Container(
      height: 100,
      width: 100,
      color: Colors.yellow,
    ),
    Container(
      height: 100,
      width: 100,
      color: Colors.green,
    ),
    const AdminProfileScreenView(),
  ];
  final List<String> screenName = ["Home", "Showroom", "Car", "Profile"];
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

/*    Iconsax.home,
    Iconsax.shop,
    Iconsax.car,
    Iconsax.user*/
