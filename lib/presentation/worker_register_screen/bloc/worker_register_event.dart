// ignore_for_file: must_be_immutable

part of 'worker_register_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///WorkerRegister widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class WorkerRegisterEvent extends Equatable {}

/// Event that is dispatched when the WorkerRegister widget is first created.
class WorkerRegisterInitialEvent extends WorkerRegisterEvent {
  @override
  List<Object?> get props => [];
}
