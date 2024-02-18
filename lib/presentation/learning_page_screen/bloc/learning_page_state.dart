// ignore_for_file: must_be_immutable

part of 'learning_page_bloc.dart';

/// Represents the state of LearningPage in the application.
class LearningPageState extends Equatable {
  LearningPageState({this.learningPageModelObj});

  LearningPageModel? learningPageModelObj;

  @override
  List<Object?> get props => [
        learningPageModelObj,
      ];
  LearningPageState copyWith({LearningPageModel? learningPageModelObj}) {
    return LearningPageState(
      learningPageModelObj: learningPageModelObj ?? this.learningPageModelObj,
    );
  }
}
