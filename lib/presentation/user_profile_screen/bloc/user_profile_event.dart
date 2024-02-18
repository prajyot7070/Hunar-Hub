// ignore_for_file: must_be_immutable

part of 'user_profile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///UserProfile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class UserProfileEvent extends Equatable {}

/// Event that is dispatched when the UserProfile widget is first created.
class UserProfileInitialEvent extends UserProfileEvent {
  @override
  List<Object?> get props => [];
}
