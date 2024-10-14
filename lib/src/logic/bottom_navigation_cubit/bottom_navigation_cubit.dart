import 'package:bloc/bloc.dart';
import 'package:car_dekho_app/src/ui/admin_screens_view/home_screen_view.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hugeicons/hugeicons.dart';

import '../../ui/admin_screens_view/admin_profile_screen_view.dart';

part 'bottom_navigation_state.dart';

class BottomNavigationCubit extends Cubit<BottomNavigationState> {
  BottomNavigationCubit() : super(BottomNavigationState(currentIndex: 0));

  void updateNavigationIndex(int index) {
    emit(state.copyWith(currentIndex: index));
  }
}
