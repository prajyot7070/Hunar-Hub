// ignore_for_file: must_be_immutable

part of 'worker_login_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///WorkerLogin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class WorkerLoginEvent extends Equatable {}

/// Event that is dispatched when the WorkerLogin widget is first created.
class WorkerLoginInitialEvent extends WorkerLoginEvent {
  @override
  List<Object?> get props => [];
}
