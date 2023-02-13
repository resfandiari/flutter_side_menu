import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

abstract class SideMenuItemData {
  const SideMenuItemData();
}

class SideMenuItemDataTile extends SideMenuItemData {
  const SideMenuItemDataTile({
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
    this.margin = Constants.itemMargin,
    this.borderRadius,
    this.selectedColor,
    this.unSelectedColor,
    this.highlightSelectedColor,
    this.hoverColor,
    this.badgePosition,
    this.badgeStyle,
  })  : assert(itemHeight >= 0.0),
        assert(icon != null || title != null),
        super();

  final bool isSelected, hasSelectedLine;
  final void Function() onTap;
  final Size selectedLineSize;
  final String? title;
  final TextStyle? titleStyle;
  final String? tooltip;
  final Widget? badgeContent;
  final BadgePosition? badgePosition;
  final BadgeStyle? badgeStyle;
  final Widget? icon;
  final double itemHeight;
  final EdgeInsetsDirectional margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? hoverColor,
      highlightSelectedColor,
      selectedColor,
      unSelectedColor;
}

class SideMenuItemDataTitle extends SideMenuItemData {
  const SideMenuItemDataTitle({
    required this.title,
    this.titleStyle,
    this.padding = Constants.itemMargin,
  }) : super();

  final String title;
  final TextStyle? titleStyle;
  final EdgeInsetsDirectional padding;
}

class SideMenuItemDataDivider extends SideMenuItemData {
  const SideMenuItemDataDivider({
    required this.divider,
    this.padding = Constants.itemMargin,
  }) : super();

  final Divider divider;
  final EdgeInsetsDirectional padding;
}
