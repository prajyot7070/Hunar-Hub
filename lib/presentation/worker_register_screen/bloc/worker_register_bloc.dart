import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/worker_register_screen/models/worker_register_model.dart';
part 'worker_register_event.dart';
part 'worker_register_state.dart';

/// A bloc that manages the state of a WorkerRegister according to the event that is dispatched to it.
class WorkerRegisterBloc
    extends Bloc<WorkerRegisterEvent, WorkerRegisterState> {
  WorkerRegisterBloc(WorkerRegisterState initialState) : super(initialState) {
    on<WorkerRegisterInitialEvent>(_onInitialize);
  }

  _onInitialize(
    WorkerRegisterInitialEvent event,
    Emitter<WorkerRegisterState> emit,
  ) async {
    emit(state.copyWith(
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      confirmpasswordController: TextEditingController(),
    ));
  }
}
