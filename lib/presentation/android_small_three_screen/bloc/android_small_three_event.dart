// ignore_for_file: must_be_immutable

part of 'android_small_three_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AndroidSmallThree widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AndroidSmallThreeEvent extends Equatable {}

/// Event that is dispatched when the AndroidSmallThree widget is first created.
class AndroidSmallThreeInitialEvent extends AndroidSmallThreeEvent {
  @override
  List<Object?> get props => [];
}
