import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/side_menu_body_data.dart';
import 'package:flutter_side_menu/src/item/side_menu_item.dart';

class SideMenuBody extends StatelessWidget {
  const SideMenuBody({
    Key? key,
    required this.minWidth,
    required this.isCompact,
    required this.data,
  }) : super(key: key);
  final double minWidth;
  final bool isCompact;
  final SideMenuBodyData data;

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (data.header != null) data.header!,
      if (data.customChild != null) data.customChild!,
      if (data.items != null)
        Expanded(
          child: ListView.builder(
            controller: ScrollController(),
            itemCount: data.items!.length,
            itemBuilder: (context, index) {
              final item = data.items![index];
              return SideMenuItem(
                minWidth: minWidth,
                isCompact: isCompact,
                data: item,
              );
            },
          ),
        ),
      if (data.footer != null) data.footer!,
    ]);
  }
}
