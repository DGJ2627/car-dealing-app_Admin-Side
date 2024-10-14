import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'admin_profile_state.dart';

class AdminProfileCubit extends Cubit<AdminProfileState> {
  AdminProfileCubit() : super(AdminProfileInitial());
}
