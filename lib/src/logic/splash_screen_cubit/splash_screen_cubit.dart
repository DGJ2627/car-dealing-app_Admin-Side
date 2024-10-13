import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


part 'splash_screen_state.dart';

class SplashScreenCubit extends Cubit<SplashScreenState> {
  SplashScreenCubit() : super(const SplashScreenState(2));

  Future<void> splashScreenTimer(FutureOr<Null> Function()? navigate) async {
    Future.delayed(
      Duration(seconds: state.splashTimeOver),
      navigate,
    );
  }
}
