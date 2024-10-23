import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_service_list_state.dart';

class UserServiceListCubit extends Cubit<UserServiceListState> {
  UserServiceListCubit() : super(const UserServiceListState());
}
