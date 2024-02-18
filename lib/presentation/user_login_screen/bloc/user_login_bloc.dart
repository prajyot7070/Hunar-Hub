import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/user_login_screen/models/user_login_model.dart';
part 'user_login_event.dart';
part 'user_login_state.dart';

/// A bloc that manages the state of a UserLogin according to the event that is dispatched to it.
class UserLoginBloc extends Bloc<UserLoginEvent, UserLoginState> {
  UserLoginBloc(UserLoginState initialState) : super(initialState) {
    on<UserLoginInitialEvent>(_onInitialize);
  }

  _onInitialize(
    UserLoginInitialEvent event,
    Emitter<UserLoginState> emit,
  ) async {
    emit(state.copyWith(
      userNameController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }
}
