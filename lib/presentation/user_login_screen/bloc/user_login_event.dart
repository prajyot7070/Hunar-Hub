// ignore_for_file: must_be_immutable

part of 'user_login_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///UserLogin widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class UserLoginEvent extends Equatable {}

/// Event that is dispatched when the UserLogin widget is first created.
class UserLoginInitialEvent extends UserLoginEvent {
  @override
  List<Object?> get props => [];
}
