// ignore_for_file: must_be_immutable

part of 'worker_register_two_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///WorkerRegisterTwo widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class WorkerRegisterTwoEvent extends Equatable {}

/// Event that is dispatched when the WorkerRegisterTwo widget is first created.
class WorkerRegisterTwoInitialEvent extends WorkerRegisterTwoEvent {
  @override
  List<Object?> get props => [];
}
