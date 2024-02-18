import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/android_small_four_screen/models/android_small_four_model.dart';
part 'android_small_four_event.dart';
part 'android_small_four_state.dart';

/// A bloc that manages the state of a AndroidSmallFour according to the event that is dispatched to it.
class AndroidSmallFourBloc
    extends Bloc<AndroidSmallFourEvent, AndroidSmallFourState> {
  AndroidSmallFourBloc(AndroidSmallFourState initialState)
      : super(initialState) {
    on<AndroidSmallFourInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AndroidSmallFourInitialEvent event,
    Emitter<AndroidSmallFourState> emit,
  ) async {}
}
