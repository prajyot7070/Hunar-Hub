import 'dart:ui';
import 'package:jaya_s_application3/core/app_export.dart';
import 'package:flutter/material.dart';

/// A class that offers pre-defined button styles for customizing button appearance.
class CustomButtonStyles {
  // Filled button style
  static ButtonStyle get fillGray => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(
              24.h,
            ),
            topRight: Radius.circular(
              23.h,
            ),
            bottomLeft: Radius.circular(
              24.h,
            ),
            bottomRight: Radius.circular(
              23.h,
            ),
          ),
        ),
      );
  static ButtonStyle get fillGrayTL5 => ElevatedButton.styleFrom(
        backgroundColor: appTheme.gray50,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.h),
        ),
      );

  // Gradient button style
  static BoxDecoration get gradientPrimaryToOnPrimaryDecoration =>
      BoxDecoration(
        borderRadius: BorderRadius.circular(18.h),
        gradient: LinearGradient(
          begin: Alignment(0.3, 0),
          end: Alignment(0.65, 1),
          colors: [
            theme.colorScheme.primary,
            theme.colorScheme.onPrimary,
          ],
        ),
      );
  // text button style
  static ButtonStyle get none => ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.transparent),
        elevation: MaterialStateProperty.all<double>(0),
      );
}
