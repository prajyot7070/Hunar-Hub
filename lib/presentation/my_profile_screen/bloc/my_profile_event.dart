// ignore_for_file: must_be_immutable

part of 'my_profile_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///MyProfile widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class MyProfileEvent extends Equatable {}

/// Event that is dispatched when the MyProfile widget is first created.
class MyProfileInitialEvent extends MyProfileEvent {
  @override
  List<Object?> get props => [];
}
