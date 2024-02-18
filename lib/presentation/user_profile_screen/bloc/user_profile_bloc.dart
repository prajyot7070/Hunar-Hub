import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/user_profile_screen/models/user_profile_model.dart';
part 'user_profile_event.dart';
part 'user_profile_state.dart';

/// A bloc that manages the state of a UserProfile according to the event that is dispatched to it.
class UserProfileBloc extends Bloc<UserProfileEvent, UserProfileState> {
  UserProfileBloc(UserProfileState initialState) : super(initialState) {
    on<UserProfileInitialEvent>(_onInitialize);
  }

  _onInitialize(
    UserProfileInitialEvent event,
    Emitter<UserProfileState> emit,
  ) async {}
}
