import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/android_small_five_screen/models/android_small_five_model.dart';
part 'android_small_five_event.dart';
part 'android_small_five_state.dart';

/// A bloc that manages the state of a AndroidSmallFive according to the event that is dispatched to it.
class AndroidSmallFiveBloc
    extends Bloc<AndroidSmallFiveEvent, AndroidSmallFiveState> {
  AndroidSmallFiveBloc(AndroidSmallFiveState initialState)
      : super(initialState) {
    on<AndroidSmallFiveInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AndroidSmallFiveInitialEvent event,
    Emitter<AndroidSmallFiveState> emit,
  ) async {
    emit(state.copyWith(
      nameEditTextController: TextEditingController(),
      phoneEditTextController: TextEditingController(),
      ageEditTextController: TextEditingController(),
    ));
  }
}
