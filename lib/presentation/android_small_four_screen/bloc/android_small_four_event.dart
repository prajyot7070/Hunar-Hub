// ignore_for_file: must_be_immutable

part of 'android_small_four_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AndroidSmallFour widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AndroidSmallFourEvent extends Equatable {}

/// Event that is dispatched when the AndroidSmallFour widget is first created.
class AndroidSmallFourInitialEvent extends AndroidSmallFourEvent {
  @override
  List<Object?> get props => [];
}
