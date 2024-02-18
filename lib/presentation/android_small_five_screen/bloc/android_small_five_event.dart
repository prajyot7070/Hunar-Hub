// ignore_for_file: must_be_immutable

part of 'android_small_five_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///AndroidSmallFive widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class AndroidSmallFiveEvent extends Equatable {}

/// Event that is dispatched when the AndroidSmallFive widget is first created.
class AndroidSmallFiveInitialEvent extends AndroidSmallFiveEvent {
  @override
  List<Object?> get props => [];
}
