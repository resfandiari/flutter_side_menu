import 'package:flutter/material.dart';
import 'package:flutter_side_menu/src/component/resizer.dart';
import 'package:flutter_side_menu/src/component/resizer_toggle.dart';
import 'package:flutter_side_menu/src/data/resizer_data.dart';
import 'package:flutter_side_menu/src/data/resizer_toggle_data.dart';
import 'package:flutter_side_menu/src/data/side_menu_data.dart';
import 'package:flutter_side_menu/src/data/side_menu_builder_data.dart';
import 'package:flutter_side_menu/src/side_menu_body.dart';
import 'package:flutter_side_menu/src/side_menu_controller.dart';
import 'package:flutter_side_menu/src/side_menu_mode.dart';
import 'package:flutter_side_menu/src/side_menu_position.dart';
import 'package:flutter_side_menu/src/side_menu_priority.dart';
import 'package:flutter_side_menu/src/side_menu_width_mixin.dart';
import 'package:flutter_side_menu/src/utils/constants.dart';

typedef SideMenuBuilder = SideMenuData Function(
  SideMenuBuilderData data,
);

class SideMenu extends StatefulWidget {
  const SideMenu({
    Key? key,
    required this.builder,
    this.controller,
    this.mode = SideMenuMode.auto,
    this.priority = SideMenuPriority.mode,
    this.position = SideMenuPosition.left,
    this.minWidth = Constants.minWidth,
    this.maxWidth = Constants.maxWidth,
    this.hasResizer = true,
    this.hasResizerToggle = true,
    this.backgroundColor = Constants.backgroundColor,
    this.resizerData,
    this.resizerToggleData,
  })  : assert(minWidth >= 0.0),
        assert(maxWidth > 0.0),
        assert(resizerData != null ? hasResizer : true),
        assert(resizerToggleData != null ? hasResizerToggle : true),
        super(key: key);

  final SideMenuBuilder builder;
  final SideMenuController? controller;
  final SideMenuMode mode;
  final SideMenuPriority priority;
  final SideMenuPosition position;
  final double minWidth, maxWidth;
  final bool hasResizer, hasResizerToggle;
  final Color backgroundColor;
  final ResizerData? resizerData;
  final ResizerToggleData? resizerToggleData;

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> with SideMenuWidthMixin {
  double _currentWidth = Constants.zeroWidth;

  @override
  void initState() {
    if (widget.controller != null) {
      widget.controller?.open = _openMenu;
      widget.controller?.close = _closeMenu;
      widget.controller?.toggle = _toggleMenu;
    }
    super.initState();
  }

  void _openMenu() {
    setState(() {
      _currentWidth = widget.maxWidth;
    });
  }

  void _closeMenu() {
    setState(() {
      _currentWidth = widget.minWidth;
    });
  }

  void _toggleMenu() {
    setState(() {
      _currentWidth =
          _currentWidth == widget.minWidth ? widget.maxWidth : widget.minWidth;
    });
  }

  @override
  void didUpdateWidget(covariant SideMenu oldWidget) {
    if (oldWidget.mode != widget.mode ||
        oldWidget.priority != widget.priority ||
        oldWidget.hasResizer != widget.hasResizer ||
        oldWidget.minWidth != widget.minWidth ||
        oldWidget.maxWidth != widget.maxWidth) {
      _calculateMenuWidthSize();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    _calculateMenuWidthSize();
    super.didChangeDependencies();
  }

  void _calculateMenuWidthSize() {
    _currentWidth = calculateWidthSize(
      priority: widget.priority,
      hasResizer: widget.hasResizer,
      minWidth: widget.minWidth,
      maxWidth: widget.maxWidth,
      currentWidth: _currentWidth,
      mode: widget.mode,
      deviceWidth: MediaQuery.of(context).size.width,
    );
  }

  @override
  Widget build(BuildContext context) => _createView();

  Widget _createView() {
    final size = MediaQuery.of(context).size;
    final content = _content(size);

    if (widget.hasResizer || widget.hasResizerToggle) {
      if (widget.hasResizer && widget.hasResizerToggle) {
        return _hasResizerToggle(
          child: _hasResizer(child: content),
        );
      } else if (widget.hasResizer) {
        return _hasResizer(child: content);
      } else {
        return _hasResizerToggle(child: content);
      }
    } else {
      return content;
    }
  }

  Widget _content(Size size) {
    return AnimatedContainer(
      duration: Constants.duration,
      width: _currentWidth,
      color: widget.backgroundColor,
      constraints: BoxConstraints(
        minHeight: size.height,
        maxHeight: size.height,
        minWidth: widget.minWidth,
        maxWidth: widget.maxWidth,
      ),
      child: SideMenuBody(
        isOpen: _currentWidth != widget.minWidth,
        minWidth: widget.minWidth,
        data: _builder(),
      ),
    );
  }

  SideMenuData _builder() {
    return widget.builder(SideMenuBuilderData(
      currentWidth: _currentWidth,
      minWidth: widget.minWidth,
      maxWidth: widget.maxWidth,
      isOpen: _currentWidth != widget.minWidth,
    ));
  }

  Widget _resizer() {
    return Resizer(
      data: widget.resizerData,
      onPanUpdate: (details) {
        late final double x;
        if (widget.position == SideMenuPosition.left) {
          x = details.globalPosition.dx;
        } else {
          x = MediaQuery.of(context).size.width - details.globalPosition.dx;
        }
        if (x >= widget.minWidth && x <= widget.maxWidth) {
          setState(() {
            _currentWidth = x;
          });
        } else if (x < Constants.minWidth && _currentWidth != widget.minWidth) {
          setState(() {
            _currentWidth = widget.minWidth;
          });
        } else if (x > Constants.maxWidth && _currentWidth != widget.maxWidth) {
          setState(() {
            _currentWidth = widget.maxWidth;
          });
        }
      },
    );
  }

  Widget _hasResizer({required Widget child}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.position == SideMenuPosition.right) _resizer(),
        child,
        if (widget.position == SideMenuPosition.left) _resizer(),
      ],
    );
  }

  Widget _resizerToggle() {
    return ResizerToggle(
      data: widget.resizerToggleData,
      rightArrow: _currentWidth == widget.minWidth,
      leftPosition: widget.position == SideMenuPosition.left,
      onTap: () => _toggleMenu(),
    );
  }

  Widget _hasResizerToggle({required Widget child}) {
    return Stack(
      alignment: widget.position == SideMenuPosition.left
          ? AlignmentDirectional.centerEnd
          : AlignmentDirectional.centerStart,
      children: [
        child,
        _resizerToggle(),
      ],
    );
  }
}
