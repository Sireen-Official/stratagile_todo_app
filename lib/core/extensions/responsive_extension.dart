import 'package:flutter/material.dart';

/// An extension on [BuildContext] to provide responsive utilities
extension ResponsiveExtension on BuildContext {
  /// Returns the screen width using [MediaQuery].
  double get screenWidth => MediaQuery.of(this).size.width;

  /// Returns the screen height using [MediaQuery].
  double get screenHeight => MediaQuery.of(this).size.height;

  /// Determines if the current device is a desktop based on screen width.
  bool get isDesktop => screenWidth > 1024;

  /// Determines if the current device is a tablet based on screen width.
  bool get isTablet => screenWidth >= 748 && screenWidth < 1024;

  /// Determines if the current device is a mobile based on screen width.
  bool get isMobile => screenWidth < 748;

  /// Calculates a width proportionate to the screen width and a given breakpoint.
  double getWidth(double width, double breakpointWidth) =>
      screenWidth * (width / breakpointWidth);

  /// Calculates a height proportionate to the screen width and a given breakpoint.
  double getHeight(double height, double breakpointHeight) =>
      screenWidth * (height / breakpointHeight);
}
