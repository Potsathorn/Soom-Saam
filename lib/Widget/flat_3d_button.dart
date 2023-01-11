import 'package:flutter/material.dart';

class CustomFlat3dButton extends StatefulWidget {
  const CustomFlat3dButton(
      {super.key,
      this.width = 20,
      this.height = 20,
      this.elevation = 5,
      this.color = const Color(0xFFBF0614),
      this.shadowColor = const Color(0xFF6B0003),
      this.child,
      this.onTap,
      this.enable = true});

  final double width;
  final double height;
  final double elevation;
  final Color color;
  final Color shadowColor;
  final bool enable;
  final Widget? child;
  final void Function()? onTap;

  @override
  State<CustomFlat3dButton> createState() => _CustomFlat3dButtonState();
}

class _CustomFlat3dButtonState extends State<CustomFlat3dButton> {
  late double _elevation;
  @override
  void initState() {
    super.initState();

    _elevation = widget.elevation;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (_) {
        if (widget.enable) {
          setState(() {
            _elevation = 0;
          });
        }
      },
      onTapUp: (_) {
        if (widget.enable) {
          setState(() {
            _elevation = widget.elevation;
          });
        }
      },
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: AnimatedContainer(
          width: widget.width,
          height: widget.height,
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: widget.elevation - _elevation),
          duration: const Duration(milliseconds: 150),
          decoration: BoxDecoration(
            color: widget.color,
            border: Border(
              bottom: BorderSide(
                color: widget.shadowColor,
                // color: color.shade700,
                width: _elevation,
              ),
            ),
          ),
          // padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
          child: widget.child,
        ),
      ),
    );
  }
}
