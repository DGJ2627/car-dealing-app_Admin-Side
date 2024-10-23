part of 'user_document_verify_cubit.dart';

class UserDocumentVerifyState extends Equatable {
  final bool isLogged;
  final bool isLoading;
  final List<UserDocumentVerifyModel>? userDocumentList;

  const UserDocumentVerifyState(
      {required this.isLogged, required this.isLoading, this.userDocumentList});

  UserDocumentVerifyState copyWith({
    bool? isLogged,
    bool? isLoading,
    List<UserDocumentVerifyModel>? userDocumentList,
  }) {
    return UserDocumentVerifyState(
        isLogged: isLogged ?? this.isLogged,
        isLoading: isLoading ?? this.isLoading,
        userDocumentList: userDocumentList ?? this.userDocumentList);
  }

  @override
  List<Object> get props => [
        isLogged,
        isLoading,
      ];
}
