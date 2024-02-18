import '../learning_page_screen/widgets/learningpage_item_widget.dart';
import 'bloc/learning_page_bloc.dart';
import 'models/learning_page_model.dart';
import 'models/learningpage_item_model.dart';
import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:jaya_s_application3/widgets/app_bar/appbar_subtitle.dart';
import 'package:jaya_s_application3/widgets/app_bar/appbar_title.dart';
import 'package:jaya_s_application3/widgets/app_bar/custom_app_bar.dart';
import 'package:jaya_s_application3/widgets/custom_icon_button.dart';

class LearningPageScreen extends StatelessWidget {
  const LearningPageScreen({Key? key})
      : super(
          key: key,
        );

  static Widget builder(BuildContext context) {
    return BlocProvider<LearningPageBloc>(
      create: (context) => LearningPageBloc(LearningPageState(
        learningPageModelObj: LearningPageModel(),
      ))
        ..add(LearningPageInitialEvent()),
      child: LearningPageScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: SizedBox(
          width: double.maxFinite,
          child: Column(
            children: [
              SizedBox(height: 26.v),
              _buildLearningPage(context),
            ],
          ),
        ),
        bottomNavigationBar: _buildBottomBar(context),
      ),
    );
  }

  /// Section Widget
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return CustomAppBar(
      title: Padding(
        padding: EdgeInsets.only(left: 18.h),
        child: Column(
          children: [
            AppbarTitle(
              text: "lbl_categories".tr,
              margin: EdgeInsets.only(right: 71.h),
            ),
            AppbarSubtitle(
              text: "msg_learn_more_achieve".tr,
            ),
          ],
        ),
      ),
      actions: [
        Card(
          clipBehavior: Clip.antiAlias,
          elevation: 0,
          margin: EdgeInsets.fromLTRB(20.h, 23.v, 20.h, 17.v),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusStyle.roundedBorder26,
          ),
          child: Container(
            height: 53.adaptSize,
            width: 53.adaptSize,
            padding: EdgeInsets.all(1.h),
            decoration: AppDecoration.gradientPrimaryToDeepPurple.copyWith(
              borderRadius: BorderRadiusStyle.roundedBorder26,
            ),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    height: 49.adaptSize,
                    width: 49.adaptSize,
                    margin: EdgeInsets.only(
                      right: 1.h,
                      bottom: 1.v,
                    ),
                    decoration: BoxDecoration(
                      color: appTheme.blueGray100,
                      borderRadius: BorderRadius.circular(
                        24.h,
                      ),
                    ),
                  ),
                ),
                CustomImageView(
                  imagePath: ImageConstant.imgStubProfImg,
                  height: 49.adaptSize,
                  width: 49.adaptSize,
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(1.h),
                ),
              ],
            ),
          ),
        ),
      ],
      styleType: Style.bgFill,
    );
  }

  /// Section Widget
  Widget _buildLearningPage(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 36.h),
      child:
          BlocSelector<LearningPageBloc, LearningPageState, LearningPageModel?>(
        selector: (state) => state.learningPageModelObj,
        builder: (context, learningPageModelObj) {
          return GridView.builder(
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 123.v,
              crossAxisCount: 2,
              mainAxisSpacing: 1.h,
              crossAxisSpacing: 1.h,
            ),
            physics: NeverScrollableScrollPhysics(),
            itemCount: learningPageModelObj?.learningpageItemList.length ?? 0,
            itemBuilder: (context, index) {
              LearningpageItemModel model =
                  learningPageModelObj?.learningpageItemList[index] ??
                      LearningpageItemModel();
              return LearningpageItemWidget(
                model,
              );
            },
          );
        },
      ),
    );
  }

  /// Section Widget
  Widget _buildBottomBar(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(1),
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30.h),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(32.h, 7.v, 40.h, 7.v),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomIconButton(
              height: 42.adaptSize,
              width: 42.adaptSize,
              child: CustomImageView(
                imagePath: ImageConstant.imgCalculator,
              ),
            ),
            CustomIconButton(
              height: 42.adaptSize,
              width: 42.adaptSize,
              child: CustomImageView(
                imagePath: ImageConstant.imgLock,
              ),
            ),
            CustomIconButton(
              height: 42.adaptSize,
              width: 42.adaptSize,
              child: CustomImageView(
                imagePath: ImageConstant.imgCheckmark,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
