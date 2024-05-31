import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_data.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';
import 'package:flutter_side_menu/src/item/export.dart';

class SideMenuBody extends StatelessWidget {
  const SideMenuBody({
    super.key,
    required this.minWidth,
    required this.isOpen,
    required this.data,
  });

  final double minWidth;
  final bool isOpen;
  final SideMenuData data;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (data.header != null)
          _buildAnimatedPart(
            animData: data.animHeader,
            child: data.header!,
          ),
        if (data.customChild != null)
          Expanded(
            flex: data.customChildFlex,
            child: _buildAnimatedPart(
              animData: data.animCustomChild,
              child: data.customChild!,
            ),
          ),
        if (data.spacerAfterCustomChild != null) data.spacerAfterCustomChild!,
        if (data.items != null)
          Expanded(
            child: _buildAnimatedPart(
              animData: data.animItems,
              child: ListView.builder(
                controller: ScrollController(),
                itemCount: data.items!.length,
                itemBuilder: (context, index) {
                  final item = data.items![index];
                  return _buildSideMenuItem(item);
                },
              ),
            ),
          ),
        if (data.spacerAfterItems != null) data.spacerAfterItems!,
        if (data.footer != null)
          _buildAnimatedPart(
            animData: data.animFooter,
            child: data.footer!,
          ),
      ],
    );
  }

  Widget _buildAnimatedPart({
    required SideMenuItemsAnimationData? animData,
    required Widget child,
  }) {
    if (animData != null) {
      return AnimatedScale(
        scale: isOpen ? 1 : animData.mainScale,
        duration: animData.duration,
        child: child,
      );
    }
    return child;
  }

  Widget _buildSideMenuItem(SideMenuItemData item) {
    return switch (item) {
      (SideMenuItemDataTile _) => SideMenuItemTile(
          minWidth: minWidth,
          isOpen: isOpen,
          data: item,
        ),
      (SideMenuItemDataTitle _) => SideMenuItemTitle(
          data: item,
        ),
      (SideMenuItemDataDivider _) => SideMenuItemDivider(
          data: item,
        ),
      _ => const SizedBox.shrink(),
    };
  }
}
