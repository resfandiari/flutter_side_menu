import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_item_data.dart';

class SideMenuItemDivider extends StatelessWidget {
  const SideMenuItemDivider({
    super.key,
    required this.data,
  });
  final SideMenuItemDataDivider data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: data.padding,
      child: data.divider,
    );
  }
}
