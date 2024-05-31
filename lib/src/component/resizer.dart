import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/resizer_data.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

class Resizer extends StatefulWidget {
  const Resizer({
    super.key,
    required this.onPanUpdate,
    ResizerData? data,
  })  : data = data ?? const ResizerData();

  final Function(DragUpdateDetails details) onPanUpdate;
  final ResizerData data;

  @override
  State<Resizer> createState() => _ResizerState();
}

class _ResizerState extends State<Resizer> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
  }

  _handleUpdate(DragUpdateDetails details) {
    widget.onPanUpdate(details);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GestureDetector(
        onPanUpdate: _handleUpdate,
        child: InkWell(
          mouseCursor: SystemMouseCursors.resizeLeftRight,
          onTap: () {},
          onHover: (hover) {
            setState(() {
              _visible = hover;
            });
          },
          child: AnimatedContainer(
            color: _visible
                ? widget.data.resizerHoverColor
                : widget.data.resizerColor,
            duration: Constants.duration,
            width: widget.data.resizerWidth,
            height: MediaQuery.sizeOf(context).height,
          ),
        ),
      ),
    );
  }
}
