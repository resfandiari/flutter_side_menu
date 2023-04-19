import 'package:auto_size_text/auto_size_text.dart';
import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

class SideMenuItemTile extends StatefulWidget {
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
  State<SideMenuItemTile> createState() => _SideMenuItemTileState();
}

class _SideMenuItemTileState extends State<SideMenuItemTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.data.itemHeight,
      margin: widget.data.margin,
      decoration: ShapeDecoration(
        shape: shape(context),
        color: widget.data.isSelected
            ? widget.data.highlightSelectedColor ??
                Theme.of(context).colorScheme.secondaryContainer
            : null,
      ),
      child: Material(
        color: Colors.transparent,
        clipBehavior: Clip.hardEdge,
        shape: shape(context),
        child: InkWell(
          onTap: widget.data.onTap,
          hoverColor: widget.data.hoverColor,
          child: _createView(context: context),
        ),
      ),
    );
  }

  OutlinedBorder shape(BuildContext context) {
    return widget.data.borderRadius != null
        ? RoundedRectangleBorder(borderRadius: widget.data.borderRadius!)
        : Theme.of(context).useMaterial3
            ? const StadiumBorder()
            : RoundedRectangleBorder(borderRadius: BorderRadius.circular(4));
  }

  Color getSelectedColor() {
    return widget.data.isSelected
        ? widget.data.selectedColor ??
            Theme.of(context).colorScheme.onSecondaryContainer
        : widget.data.unSelectedColor ??
            Theme.of(context).colorScheme.onSurfaceVariant;
  }

  Widget? getSelectedIcon() {
    return widget.data.isSelected && widget.data.selectedIcon != null
        ? widget.data.selectedIcon
        : widget.data.icon;
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

    return widget.data.isSelected && widget.data.hasSelectedLine
        ? _hasSelectedLine(child: content)
        : content;
  }

  Widget _hasTooltip({
    required Widget child,
  }) {
    if (widget.data.tooltip != null) {
      return Tooltip(
        message: widget.data.tooltip,
        child: child,
      );
    }
    return child;
  }

  Widget _hasBadge({
    required Widget child,
  }) {
    if (widget.data.badgeContent != null) {
      return badges.Badge(
        badgeContent: Center(child: widget.data.badgeContent!),
        badgeStyle: widget.data.badgeStyle ?? Constants.badgeStyle,
        position: widget.data.badgePosition ?? Constants.badgePosition,
        child: child,
      );
    }
    return child;
  }

  Widget _content({
    required BuildContext context,
  }) {
    final hasIcon = widget.data.icon != null;
    final hasTitle = widget.data.title != null;
    if (hasIcon && hasTitle) {
      return Row(
        children: [
          _icon(),
          if (widget.isOpen)
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
    return widget.data.icon != null
        ? SizedBox(
            width: widget.minWidth - widget.data.margin.horizontal,
            height: double.maxFinite,
            child: IconTheme(
              data: Theme.of(context)
                  .iconTheme
                  .copyWith(color: getSelectedColor()),
              child: getSelectedIcon()!,
            ),
          )
        : const SizedBox.shrink();
  }

  Widget _title({
    required BuildContext context,
  }) {
    final TextStyle? titleStyle =
        widget.data.titleStyle ?? Theme.of(context).textTheme.bodyLarge;
    final TextStyle? selectedTitleStyle =
        widget.data.selectedTitleStyle ?? Theme.of(context).textTheme.bodyLarge;
    return AutoSizeText(
      widget.data.title!,
      style: widget.data.isSelected
          ? selectedTitleStyle?.copyWith(color: getSelectedColor())
          : titleStyle?.copyWith(color: getSelectedColor()),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );
  }

  Widget _selectedLine() {
    return SizedBox.fromSize(
      size: widget.data.selectedLineSize,
      child: ColoredBox(
        color: getSelectedColor(),
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
