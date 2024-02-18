import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import 'package:jaya_s_application3/presentation/worker_login_screen/models/worker_login_model.dart';
part 'worker_login_event.dart';
part 'worker_login_state.dart';

/// A bloc that manages the state of a WorkerLogin according to the event that is dispatched to it.
class WorkerLoginBloc extends Bloc<WorkerLoginEvent, WorkerLoginState> {
  WorkerLoginBloc(WorkerLoginState initialState) : super(initialState) {
    on<WorkerLoginInitialEvent>(_onInitialize);
  }

  _onInitialize(
    WorkerLoginInitialEvent event,
    Emitter<WorkerLoginState> emit,
  ) async {
    emit(state.copyWith(
      userNameController: TextEditingController(),
      passwordController: TextEditingController(),
    ));
  }
}
