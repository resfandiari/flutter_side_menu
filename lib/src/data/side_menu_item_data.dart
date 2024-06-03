import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

/// Signature for the `builder` function provide which provide solution to
/// use as badge child
/// is responsible for returning a widget which is to be rendered.
typedef SideMenuItemBadgeBuilder = Widget? Function(Widget tile);

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
    this.selectedTitleStyle,
    this.tooltip,
    this.hasSelectedLine = true,
    this.selectedLineSize = const Size(
      Constants.itemSelectedLineWidth,
      Constants.itemSelectedLineHeight,
    ),
    this.itemHeight = Constants.itemHeight,
    this.margin = Constants.itemMargin,
    this.borderRadius,
    this.selectedIcon,
    this.highlightSelectedColor,
    this.hoverColor,
    this.badgeBuilder,
    this.decoration,
    this.shape,
    this.clipBehavior = Clip.hardEdge,
  })  : assert(itemHeight >= 0.0),
        assert(icon != null || title != null),
        assert((highlightSelectedColor == null && decoration == null) ||
            (highlightSelectedColor != null
                ? decoration == null
                : decoration != null
                    ? highlightSelectedColor == null
                    : true)),
        super();

  final bool isSelected, hasSelectedLine;
  final void Function() onTap;
  final Size selectedLineSize;
  final String? title;
  final TextStyle? titleStyle;
  final TextStyle? selectedTitleStyle;
  final String? tooltip;
  final SideMenuItemBadgeBuilder? badgeBuilder;
  final Widget? icon;
  final Widget? selectedIcon;
  final double itemHeight;
  final EdgeInsetsDirectional margin;
  final BorderRadiusGeometry? borderRadius;
  final Color? hoverColor, highlightSelectedColor;
  final Decoration? decoration;
  final ShapeBorder? shape;
  final Clip clipBehavior;
}

class SideMenuItemDataTitle extends SideMenuItemData {
  const SideMenuItemDataTitle({
    required this.title,
    this.titleStyle,
    this.textAlign,
    this.padding = Constants.itemMargin,
  }) : super();

  final String title;
  final TextStyle? titleStyle;
  final TextAlign? textAlign;
  final EdgeInsetsDirectional padding;
}

class SideMenuItemDataDivider extends SideMenuItemData {
  const SideMenuItemDataDivider({
    required this.divider,
    this.padding = Constants.itemMargin,
  }) : super();

  final Widget divider;
  final EdgeInsetsDirectional padding;
}
