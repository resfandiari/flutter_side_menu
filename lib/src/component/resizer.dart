import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';
import 'package:simple_animations/simple_animations.dart';

class Resizer extends StatefulWidget {
  const Resizer({
    Key? key,
    required this.onPanUpdate,
    this.leftSide = true,
    ResizerData? data,
  })  : data = data ?? const ResizerData(),
        super(key: key);

  final Function(DragUpdateDetails details) onPanUpdate;
  final bool leftSide;
  final ResizerData data;

  @override
  State<Resizer> createState() => _ResizerState();
}

class _ResizerState extends State<Resizer> with AnimationMixin {
  late Animation<Color?> _colorAnimation;

  @override
  void initState() {
    _colorAnimation = ColorTween(
      begin: widget.data.resizerColor,
      end: widget.data.resizerHoverColor,
    ).animate(controller);

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
            if (hover) {
              controller.play(duration: Constants.duration);
            } else {
              controller.playReverse(duration: Constants.duration);
            }
          },
          child: Container(
            color: _colorAnimation.value,
            width: widget.data.resizerWidth,
            height: MediaQuery.of(context).size.height,
          ),
        ),
      ),
    );
  }
}

class ResizerData {
  const ResizerData({
    this.resizerWidth = 3,
    this.iconColor = Colors.black,
    this.resizerColor = Colors.black12,
    this.resizerHoverColor = Colors.blue,
  }) : assert(resizerWidth >= 0.0);

  final double resizerWidth;
  final Color iconColor, resizerColor, resizerHoverColor;
}
