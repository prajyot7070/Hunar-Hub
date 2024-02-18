import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import '/core/app_export.dart';
import '../models/learningpage_item_model.dart';
import 'package:jaya_s_application3/presentation/learning_page_screen/models/learning_page_model.dart';
part 'learning_page_event.dart';
part 'learning_page_state.dart';

/// A bloc that manages the state of a LearningPage according to the event that is dispatched to it.
class LearningPageBloc extends Bloc<LearningPageEvent, LearningPageState> {
  LearningPageBloc(LearningPageState initialState) : super(initialState) {
    on<LearningPageInitialEvent>(_onInitialize);
  }

  _onInitialize(
    LearningPageInitialEvent event,
    Emitter<LearningPageState> emit,
  ) async {
    emit(state.copyWith(
        learningPageModelObj: state.learningPageModelObj?.copyWith(
      learningpageItemList: fillLearningpageItemList(),
    )));
  }

  List<LearningpageItemModel> fillLearningpageItemList() {
    return List.generate(6, (index) => LearningpageItemModel());
  }
}
