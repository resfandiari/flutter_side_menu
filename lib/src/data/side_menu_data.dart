import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';

class SideMenuData {
  const SideMenuData({
    this.customChild,
    this.header,
    this.footer,
    this.items,
    this.animHeader,
    this.animCustomChild,
    this.animItems,
    this.animFooter,
    this.customChildFlex = 1,
    this.spacerAfterCustomChild,
    this.spacerAfterItems,
    this.defaultTileData,
  }) : assert(customChild != null || items != null);

  final Widget? customChild, header, footer;
  final List<SideMenuItemData>? items;
  final SideMenuItemsAnimationData? animHeader;
  final SideMenuItemsAnimationData? animCustomChild;
  final SideMenuItemsAnimationData? animItems;
  final SideMenuItemsAnimationData? animFooter;
  final int customChildFlex;
  final Spacer? spacerAfterCustomChild;
  final Spacer? spacerAfterItems;
  final SideMenuItemTileDefaults? defaultTileData;
}

class SideMenuItemsAnimationData {
  const SideMenuItemsAnimationData({
    this.mainScale = _defaultMainScale,
    this.duration = _defaultDuration,
  });
  static const double _defaultMainScale = 0.95;
  static const Duration _defaultDuration = Duration(milliseconds: 500);

  final double mainScale;
  final Duration duration;
}
