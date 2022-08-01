import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

class SideMenuItemData {
  const SideMenuItemData({
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.title,
    this.titleStyle,
    this.tooltip,
    this.badgeContent,
    this.hasSelectedLine = true,
    this.selectedLineSize = const Size(
      Constants.itemSelectedLineWidth,
      Constants.itemSelectedLineHeight,
    ),
    this.itemHeight = Constants.itemHeight,
    this.iconSize = Constants.itemIconSize,
    this.margin = Constants.itemMargin,
    this.borderRadius = Constants.radius_4,
    this.selectedColor = Constants.selectedColor,
    this.unSelectedColor = Constants.unSelectedColor,
    this.highlightSelectedColor = Constants.highlightSelectedColor,
    this.badgeColor = Constants.selectedColor,
    this.badgePosition = const BadgePosition(
      end: Constants.badgeSpaceFromEnd,
    ),
  })  : assert(itemHeight >= 0.0),
        assert(iconSize >= 0.0),
        assert(icon != null || title != null);

  final bool isSelected, hasSelectedLine;
  final void Function() onTap;
  final Size selectedLineSize;
  final String? title;
  final TextStyle? titleStyle;
  final String? tooltip;
  final Widget? badgeContent;
  final BadgePosition badgePosition;
  final IconData? icon;
  final double itemHeight, iconSize;
  final EdgeInsetsDirectional margin;
  final BorderRadius borderRadius;
  final Color selectedColor,
      unSelectedColor,
      highlightSelectedColor,
      badgeColor;
}
