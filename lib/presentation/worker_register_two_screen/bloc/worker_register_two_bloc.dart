import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/worker_register_two_screen/models/worker_register_two_model.dart';
part 'worker_register_two_event.dart';
part 'worker_register_two_state.dart';

/// A bloc that manages the state of a WorkerRegisterTwo according to the event that is dispatched to it.
class WorkerRegisterTwoBloc
    extends Bloc<WorkerRegisterTwoEvent, WorkerRegisterTwoState> {
  WorkerRegisterTwoBloc(WorkerRegisterTwoState initialState)
      : super(initialState) {
    on<WorkerRegisterTwoInitialEvent>(_onInitialize);
  }

  _onInitialize(
    WorkerRegisterTwoInitialEvent event,
    Emitter<WorkerRegisterTwoState> emit,
  ) async {
    emit(state.copyWith(
      nameController: TextEditingController(),
      phoneController: TextEditingController(),
      locationController: TextEditingController(),
    ));
  }
}
