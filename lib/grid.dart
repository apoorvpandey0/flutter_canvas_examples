import 'package:flutter/material.dart';

class GridPainter extends CustomPainter {
  // This class draws a grid with X and Y axis scales
  final double width;
  final double height;
  final Offset rulerOffset;
  final Offset gridOffset;
  GridPainter(
      {required this.width,
      required this.height,
      required this.rulerOffset,
      required this.gridOffset});
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 1
      ..color = Colors.cyan
      ..style = PaintingStyle.stroke;

    final line = Path();

    // Horizontal lines and Y axis scale
    for (var i = 0; i <= (height / gridOffset.dy).toInt(); i++) {
      line.moveTo(rulerOffset.dx + 0, rulerOffset.dy + i * gridOffset.dy);
      line.relativeLineTo(width, 0);
      canvas.drawPath(line, paint);
      writeLabel(
        canvas,
        paint,
        rulerOffset.dx / 8,
        i * gridOffset.dy + rulerOffset.dy,
        (i).toStringAsFixed(0),
      );
    }

    // Vertical lines and X axis scale
    for (var i = 0; i <= (width / gridOffset.dx).toInt(); i++) {
      line.moveTo(rulerOffset.dx + gridOffset.dx * i, rulerOffset.dy + 0);
      line.relativeLineTo(0, height);
      canvas.drawPath(line, paint);
      writeLabel(
        canvas,
        paint,
        i * gridOffset.dx + rulerOffset.dx,
        0,
        (i).toStringAsFixed(0),
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void writeLabel(Canvas canvas, Paint paint, double i, double j, String text) {
    final textStyle = TextStyle(
      color: Colors.black,
      fontSize: 20,
    );
    final textSpan = TextSpan(
      text: text,
      style: textStyle,
    );
    final textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout(
      minWidth: 0,
      maxWidth: width,
    );
    final xCenter = i;
    final yCenter = j;
    final offset = Offset(xCenter, yCenter);
    textPainter.paint(canvas, offset);
  }
}
