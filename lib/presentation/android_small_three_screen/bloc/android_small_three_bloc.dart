import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/android_small_three_screen/models/android_small_three_model.dart';
part 'android_small_three_event.dart';
part 'android_small_three_state.dart';

/// A bloc that manages the state of a AndroidSmallThree according to the event that is dispatched to it.
class AndroidSmallThreeBloc
    extends Bloc<AndroidSmallThreeEvent, AndroidSmallThreeState> {
  AndroidSmallThreeBloc(AndroidSmallThreeState initialState)
      : super(initialState) {
    on<AndroidSmallThreeInitialEvent>(_onInitialize);
  }

  _onInitialize(
    AndroidSmallThreeInitialEvent event,
    Emitter<AndroidSmallThreeState> emit,
  ) async {}
}
