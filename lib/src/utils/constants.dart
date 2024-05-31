import 'package:flutter/material.dart';

class Constants {
  /// Size
  static const double minWidth = 50.0;
  static const double maxWidth = 250.0;
  static const double zeroWidth = 0.0;
  static const double itemHeight = 40.0;
  static const double itemSelectedLineHeight = 20.0;
  static const double itemSelectedLineWidth = 4.0;

  /// Durations
  static const Duration duration = Duration(milliseconds: 200);

  /// Colors
  static const Color selectedColor = Color(0xff0055c3);

  /// Padding
  static const EdgeInsetsDirectional textStartPadding =
      EdgeInsetsDirectional.only(
    start: 16,
  );

  /// Margin
  static const EdgeInsetsDirectional itemMargin = EdgeInsetsDirectional.only(
    start: 4,
    end: 4,
    top: 4,
  );
}
