part of 'sign_in_cubit.dart';

class SignInState extends Equatable {
  final bool isLoggedIn;
  final bool isLoading;

  const SignInState({required this.isLoggedIn, required this.isLoading});

  SignInState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
  }) {
    return SignInState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoggedIn,
    );
  }

  @override
  List<Object> get props => [];
}
