import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/login_choice_screen/models/login_choice_model.dart';
part 'login_choice_event.dart';
part 'login_choice_state.dart';

/// A bloc that manages the state of a LoginChoice according to the event that is dispatched to it.
class LoginChoiceBloc extends Bloc<LoginChoiceEvent, LoginChoiceState> {
  LoginChoiceBloc(LoginChoiceState initialState) : super(initialState) {
    on<LoginChoiceInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LoginChoiceInitialEvent event,
    Emitter<LoginChoiceState> emit,
  ) async {}
}
