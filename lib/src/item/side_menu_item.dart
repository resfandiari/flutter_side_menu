import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

class SideMenuItem extends StatelessWidget {
  const SideMenuItem({
    Key? key,
    required this.isCompact,
    required this.minWidth,
    required this.data,
  }) : super(key: key);
  final SideMenuItemData data;
  final bool isCompact;
  final double minWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: data.itemHeight,
      margin: data.margin,
      decoration: BoxDecoration(
        color: data.isSelected ? data.highlightSelectedColor : null,
        borderRadius: data.borderRadius,
      ),
      child: InkWell(
        onTap: data.onTap,
        borderRadius: data.borderRadius,
        child: _createView(context: context),
      ),
    );
  }

  Widget _createView({
    required BuildContext context,
  }) {
    final content = _tooltip(
      child: _content(context: context),
    );

    return data.isSelected && data.hasSelectedLine
        ? _hasSelectedLine(child: content)
        : content;
  }

  Widget _tooltip({
    required Widget child,
  }) {
    if (data.tooltip != null) {
      return Tooltip(
        message: data.tooltip,
        child: child,
      );
    }
    return child;
  }

  Widget _content({
    required BuildContext context,
  }) {
    final hasIcon = data.icon != null;
    final hasTitle = data.title != null;
    if (hasIcon && hasTitle) {
      return Row(
        children: [
          _icon(),
          if (!isCompact)
            Expanded(
              child: _title(context: context),
            ),
        ],
      );
    } else if (hasIcon) {
      return Align(
        alignment: AlignmentDirectional.centerStart,
        child: _icon(),
      );
    } else {
      return Container(
        alignment: AlignmentDirectional.centerStart,
        padding: Constants.textStartPadding,
        child: _title(context: context),
      );
    }
  }

  Widget _icon() {
    return SizedBox(
      width: minWidth - data.margin.horizontal,
      height: double.maxFinite,
      child: Icon(
        data.icon!,
        color: data.isSelected ? data.selectedColor : data.unSelectedColor,
        size: data.iconSize,
      ),
    );
  }

  Widget _title({
    required BuildContext context,
  }) {
    final TextStyle? titleStyle =
        data.titleStyle ?? Theme.of(context).textTheme.bodyText1;
    return AutoSizeText(
      data.title!,
      style: titleStyle?.copyWith(
        color: data.isSelected ? data.selectedColor : data.unSelectedColor,
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _selectedLine() {
    return SizedBox.fromSize(
      size: data.selectedLineSize,
      child: ColoredBox(
        color: data.isSelected ? data.selectedColor : data.unSelectedColor,
      ),
    );
  }

  Widget _hasSelectedLine({
    required Widget child,
  }) {
    return Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        child,
        _selectedLine(),
      ],
    );
  }
}

class SideMenuItemData {
  const SideMenuItemData({
    required this.isSelected,
    required this.onTap,
    this.icon,
    this.title,
    this.titleStyle,
    this.tooltip,
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
  })  : assert(itemHeight >= 0.0),
        assert(iconSize >= 0.0),
        assert(icon != null || title != null);

  final bool isSelected, hasSelectedLine;
  final void Function() onTap;
  final Size selectedLineSize;
  final String? title;
  final TextStyle? titleStyle;
  final String? tooltip;
  final IconData? icon;
  final double itemHeight, iconSize;
  final EdgeInsetsDirectional margin;
  final BorderRadius borderRadius;
  final Color selectedColor, unSelectedColor, highlightSelectedColor;
}
