// ignore_for_file: must_be_immutable

import 'package:equatable/equatable.dart';
import 'learningpage_item_model.dart';

/// This class defines the variables used in the [learning_page_screen],
/// and is typically used to hold data that is passed between different parts of the application.
class LearningPageModel extends Equatable {
  LearningPageModel({this.learningpageItemList = const []}) {}

  List<LearningpageItemModel> learningpageItemList;

  LearningPageModel copyWith(
      {List<LearningpageItemModel>? learningpageItemList}) {
    return LearningPageModel(
      learningpageItemList: learningpageItemList ?? this.learningpageItemList,
    );
  }

  @override
  List<Object?> get props => [learningpageItemList];
}
