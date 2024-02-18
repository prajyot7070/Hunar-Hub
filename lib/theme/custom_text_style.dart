import 'package:flutter/material.dart';
import '../core/app_export.dart';

/// A collection of pre-defined text styles for customizing text appearance,
/// categorized by different font families and weights.
/// Additionally, this class includes extensions on [TextStyle] to easily apply specific font families to text.

class CustomTextStyles {
  // Body text style
  static get bodyMediumInikaOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 14.fSize,
      );
  static get bodyMediumInikaffc7a2f6 =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: Color(0XFFC7A2F6),
        fontSize: 14.fSize,
      );
  static get bodyMediumInikaffffffff =>
      theme.textTheme.bodyMedium!.inika.copyWith(
        color: Color(0XFFFFFFFF),
        fontSize: 14.fSize,
      );
  static get bodyMediumOnError => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get bodyMediumOnPrimary => theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get bodyMediumOnPrimaryContainer =>
      theme.textTheme.bodyMedium!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontSize: 15.fSize,
      );
  static get bodyMediumff000000 => theme.textTheme.bodyMedium!.copyWith(
        color: Color(0XFF000000),
      );
  // Display text style
  static get displayMediumInikaff372e5d =>
      theme.textTheme.displayMedium!.inika.copyWith(
        color: Color(0XFF372E5D),
      );
  static get displayMediumRegular => theme.textTheme.displayMedium!.copyWith(
        fontSize: 40.fSize,
        fontWeight: FontWeight.w400,
      );
  // Headline style
  static get headlineLargeInika => theme.textTheme.headlineLarge!.inika;
  static get headlineLargeInikaPrimaryContainer =>
      theme.textTheme.headlineLarge!.inika.copyWith(
        color: theme.colorScheme.primaryContainer,
      );
  static get headlineLargeInikaff4d2d61 =>
      theme.textTheme.headlineLarge!.inika.copyWith(
        color: Color(0XFF4D2D61),
        fontWeight: FontWeight.w700,
      );
  static get headlineLargeInikaffffffff =>
      theme.textTheme.headlineLarge!.inika.copyWith(
        color: Color(0XFFFFFFFF),
      );
  static get headlineLargeff21e2f5 => theme.textTheme.headlineLarge!.copyWith(
        color: Color(0XFF21E2F5),
      );
  static get headlineSmallInikaOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.inika.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallOnPrimaryContainer =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
      );
  static get headlineSmallOnPrimaryContainerBold =>
      theme.textTheme.headlineSmall!.copyWith(
        color: theme.colorScheme.onPrimaryContainer,
        fontWeight: FontWeight.w700,
      );
  // Title text style
  static get titleLargeInikaBlue800 =>
      theme.textTheme.titleLarge!.inika.copyWith(
        color: appTheme.blue800,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeInikaOnPrimary =>
      theme.textTheme.titleLarge!.inika.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
  static get titleLargeOnError => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onError,
      );
  static get titleLargeOnPrimary => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
      );
  static get titleLargeOnPrimaryBold => theme.textTheme.titleLarge!.copyWith(
        color: theme.colorScheme.onPrimary,
        fontWeight: FontWeight.w700,
      );
}

extension on TextStyle {
  TextStyle get inika {
    return copyWith(
      fontFamily: 'Inika',
    );
  }

  TextStyle get poppins {
    return copyWith(
      fontFamily: 'Poppins',
    );
  }
}
