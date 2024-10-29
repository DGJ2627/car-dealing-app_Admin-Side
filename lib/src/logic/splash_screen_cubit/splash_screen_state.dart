part of 'splash_screen_cubit.dart';

class SplashScreenState extends Equatable {
  final int splashTimeOver;

  const SplashScreenState(this.splashTimeOver);

  @override
  List<Object?> get props => [splashTimeOver];

  SplashScreenState copyWith({int? splashTimeOver}) {
    return SplashScreenState(splashTimeOver ?? this.splashTimeOver);
  }
}
