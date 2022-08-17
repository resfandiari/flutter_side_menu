import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

class SideMenuItemTile extends StatelessWidget {
  const SideMenuItemTile({
    Key? key,
    required this.isOpen,
    required this.minWidth,
    required this.data,
  }) : super(key: key);
  final SideMenuItemDataTile data;
  final bool isOpen;
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
    final content = _hasTooltip(
      child: _hasBadge(
        child: _content(
          context: context,
        ),
      ),
    );

    return data.isSelected && data.hasSelectedLine
        ? _hasSelectedLine(child: content)
        : content;
  }

  Widget _hasTooltip({
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

  Widget _hasBadge({
    required Widget child,
  }) {
    if (data.badgeContent != null) {
      return Badge(
        badgeContent: data.badgeContent!,
        badgeColor: data.badgeColor,
        position: data.badgePosition,
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
          if (isOpen)
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
      child: data.icon,
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
