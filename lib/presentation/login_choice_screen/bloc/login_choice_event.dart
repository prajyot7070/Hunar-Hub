// ignore_for_file: must_be_immutable

part of 'login_choice_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LoginChoice widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LoginChoiceEvent extends Equatable {}

/// Event that is dispatched when the LoginChoice widget is first created.
class LoginChoiceInitialEvent extends LoginChoiceEvent {
  @override
  List<Object?> get props => [];
}
