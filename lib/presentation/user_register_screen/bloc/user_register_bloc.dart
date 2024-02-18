import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/user_register_screen/models/user_register_model.dart';
part 'user_register_event.dart';
part 'user_register_state.dart';

/// A bloc that manages the state of a UserRegister according to the event that is dispatched to it.
class UserRegisterBloc extends Bloc<UserRegisterEvent, UserRegisterState> {
  UserRegisterBloc(UserRegisterState initialState) : super(initialState) {
    on<UserRegisterInitialEvent>(_onInitialize);
  }

  _onInitialize(
    UserRegisterInitialEvent event,
    Emitter<UserRegisterState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmpasswordController: TextEditingController(),
    ));
  }
}
