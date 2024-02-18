// ignore_for_file: must_be_immutable

part of 'user_register_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///UserRegister widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class UserRegisterEvent extends Equatable {}

/// Event that is dispatched when the UserRegister widget is first created.
class UserRegisterInitialEvent extends UserRegisterEvent {
  @override
  List<Object?> get props => [];
}
