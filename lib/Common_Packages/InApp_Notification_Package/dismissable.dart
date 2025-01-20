import 'package:flutter/material.dart';

class CustomDismissible extends StatefulWidget {
  final Widget child;
  final Function onDismissed;

  const CustomDismissible({
    super.key,
    required this.child,
    required this.onDismissed,
  });

  @override
  CustomDismissibleState createState() => CustomDismissibleState();
}

class CustomDismissibleState extends State<CustomDismissible> {
  double _dragStart = 0.0;
  double _dragDistance = 0.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onHorizontalDragStart: (details) {
        _dragStart = details.localPosition.dx;
      },
      onHorizontalDragUpdate: (details) {
        setState(() => _dragDistance = details.localPosition.dx - _dragStart);
      },
      onHorizontalDragEnd: (details) {
        if (_dragDistance < -100) {
          widget.onDismissed();
          _dragStart = 0.0;
          _dragDistance = 0.0;
        } else {
          widget.onDismissed();
          _dragStart = 0.0;
          _dragDistance = 0.0;
        }
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        transform: Matrix4.translationValues(_dragDistance, 0.0, 0.0),
        child: widget.child,
      ),
    );
  }
}
