import '../models/learningpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';

// ignore: must_be_immutable
class LearningpageItemWidget extends StatelessWidget {
  LearningpageItemWidget(
    this.learningpageItemModelObj, {
    Key? key,
  }) : super(
          key: key,
        );

  LearningpageItemModel learningpageItemModelObj;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 122.adaptSize,
      width: 122.adaptSize,
      decoration: BoxDecoration(
        color: appTheme.blueGray100,
        borderRadius: BorderRadius.circular(
          30.h,
        ),
        boxShadow: [
          BoxShadow(
            color: appTheme.blue800.withOpacity(0.6),
            spreadRadius: 2.h,
            blurRadius: 2.h,
            offset: Offset(
              6,
              9,
            ),
          ),
        ],
      ),
    );
  }
}
