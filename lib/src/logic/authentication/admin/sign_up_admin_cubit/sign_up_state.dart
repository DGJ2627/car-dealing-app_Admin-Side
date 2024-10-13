part of 'sign_up_cubit.dart';

class SignUpState extends Equatable {
  final bool isLoggedIn;
  final bool isLoading;

  const SignUpState({required this.isLoggedIn, required this.isLoading});

  SignUpState copyWith({
    bool? isLoggedIn,
    bool? isLoading,
  }) {
    return SignUpState(
      isLoggedIn: isLoggedIn ?? this.isLoggedIn,
      isLoading: isLoading ?? this.isLoggedIn,
    );
  }

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
