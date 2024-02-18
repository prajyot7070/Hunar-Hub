import 'package:flutter/material.dart';
import 'package:jaya_s_application3/core/app_export.dart';

class AppDecoration {
  // Fill decorations
  static BoxDecoration get fillBlueGray => BoxDecoration(
        color: appTheme.blueGray50,
      );
  static BoxDecoration get fillDeepPurple => BoxDecoration(
        color: appTheme.deepPurple200,
      );
  static BoxDecoration get fillErrorContainer => BoxDecoration(
        color: theme.colorScheme.errorContainer.withOpacity(1),
      );
  static BoxDecoration get fillOnPrimary => BoxDecoration(
        color: theme.colorScheme.onPrimary,
      );
  static BoxDecoration get fillOnPrimaryContainer => BoxDecoration(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static BoxDecoration get fillPrimary => BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.82),
      );

  // Gradient decorations
  static BoxDecoration get gradientDeepPurpleToOnPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.3, -0.4),
          end: Alignment(0.65, 1.86),
          colors: [
            appTheme.deepPurple200,
            theme.colorScheme.onPrimary,
          ],
        ),
      );
  static BoxDecoration get gradientOnPrimaryToDeepPurple => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.3, -0.4),
          end: Alignment(0.65, 1.86),
          colors: [
            theme.colorScheme.onPrimary,
            appTheme.deepPurple200,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToDeepPurple => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.5, 0.5),
          end: Alignment(0.41, 0.71),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onPrimary,
            appTheme.deepPurple200,
          ],
        ),
      );
  static BoxDecoration get gradientPrimaryToOnPrimary => BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment(0.3, -0.4),
          end: Alignment(0.65, 1.86),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onPrimary,
          ],
        ),
      );
}

class BorderRadiusStyle {
  // Rounded borders
  static BorderRadius get roundedBorder18 => BorderRadius.circular(
        18.h,
      );
  static BorderRadius get roundedBorder26 => BorderRadius.circular(
        26.h,
      );
  static BorderRadius get roundedBorder30 => BorderRadius.circular(
        30.h,
      );
  static BorderRadius get roundedBorder50 => BorderRadius.circular(
        50.h,
      );
  static BorderRadius get roundedBorder72 => BorderRadius.circular(
        72.h,
      );
  static BorderRadius get roundedBorder84 => BorderRadius.circular(
        84.h,
      );
}

// Comment/Uncomment the below code based on your Flutter SDK version.

// For Flutter SDK Version 3.7.2 or greater.

double get strokeAlignInside => BorderSide.strokeAlignInside;

double get strokeAlignCenter => BorderSide.strokeAlignCenter;

double get strokeAlignOutside => BorderSide.strokeAlignOutside;

// For Flutter SDK Version 3.7.1 or less.

// StrokeAlign get strokeAlignInside => StrokeAlign.inside;
//
// StrokeAlign get strokeAlignCenter => StrokeAlign.center;
//
// StrokeAlign get strokeAlignOutside => StrokeAlign.outside;
