import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/data/resizer_toggle_data.dart';
import 'package:flutter_side_menu/src/utils/utils.dart';
import 'package:simple_animations/simple_animations.dart';

class ResizerToggle extends StatefulWidget {
  const ResizerToggle({
    Key? key,
    required this.onTap,
    required this.rightArrow,
    this.leftPosition = true,
    ResizerToggleData? data,
  })  : data = data ?? const ResizerToggleData(),
        super(key: key);
  final void Function() onTap;
  final bool rightArrow, leftPosition;
  final ResizerToggleData data;

  @override
  State<ResizerToggle> createState() => _ResizerToggleState();
}

class _ResizerToggleState extends State<ResizerToggle> with AnimationMixin {
  late Animation<double> buttonOpacity;

  @override
  void initState() {
    buttonOpacity = Tween<double>(
      begin: widget.data.opacity,
      end: 1,
    ).animate(
      controller,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PositionedDirectional(
      top: widget.data.topPosition,
      child: InkWell(
        onTap: () => widget.onTap(),
        onHover: (isHovering) {
          if (isHovering) {
            controller.play(duration: Duration.zero);
          } else {
            controller.playReverse(duration: Duration.zero);
          }
        },
        child: Opacity(
          opacity: buttonOpacity.value,
          child: RotatedBox(
            quarterTurns: widget.leftPosition
                ? widget.rightArrow
                    ? 12
                    : 6
                : widget.rightArrow
                    ? 6
                    : 12,
            child: Card(
              margin: EdgeInsets.zero,
              child: Icon(
                Utils.isRTL(context)
                    ? Icons.keyboard_arrow_left_outlined
                    : Icons.keyboard_arrow_right_outlined,
                color: widget.data.iconColor,
                size: widget.data.iconSize,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
