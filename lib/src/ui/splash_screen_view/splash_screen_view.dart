import 'package:car_dekho_app/src/logic/splash_screen_cubit/splash_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SplashScreenView extends StatelessWidget {
  static String routeName = "/";

  const SplashScreenView({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashScreenCubit()..splashScreenTimer(context),
      child: const SplashScreenView(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashScreenCubit, SplashScreenState>(
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: Text("Splash"),
          ),
        );
      },
    );
  }
}
