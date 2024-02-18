import '../../../core/app_export.dart';

/// This class is used in the [learningpage_item_widget] screen.
class LearningpageItemModel {
  LearningpageItemModel({this.id}) {
    id = id ?? "";
  }

  String? id;
}
