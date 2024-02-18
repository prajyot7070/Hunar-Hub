// ignore_for_file: must_be_immutable

part of 'learning_page_bloc.dart';

/// Abstract class for all events that can be dispatched from the
///LearningPage widget.
///
/// Events must be immutable and implement the [Equatable] interface.
@immutable
abstract class LearningPageEvent extends Equatable {}

/// Event that is dispatched when the LearningPage widget is first created.
class LearningPageInitialEvent extends LearningPageEvent {
  @override
  List<Object?> get props => [];
}
