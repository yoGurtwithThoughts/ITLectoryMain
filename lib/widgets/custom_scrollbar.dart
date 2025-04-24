import 'package:flutter/material.dart';

class CustomScrollbar extends SingleChildRenderObjectWidget {
  final ScrollController controller;

  const CustomScrollbar({
    super.key,
    required this.controller,
    required Widget super.child,
  });

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderCustomScrollbar(controller);
  }
}

class RenderCustomScrollbar extends RenderBox {
  final ScrollController controller;

  RenderCustomScrollbar(this.controller);

  @override
  void paint(PaintingContext context, Offset offset) {
    final Paint paint = Paint()..color = const Color.fromRGBO(151, 151, 151, 1);
    context.canvas.drawRect(
        Rect.fromLTWH(offset.dx + size.width - 10, offset.dy, 10, size.height),
        paint);
  }

  @override
  void performLayout() {
    size = constraints.biggest;
  }
}
