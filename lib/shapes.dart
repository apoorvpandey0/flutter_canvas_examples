import 'package:flutter/material.dart';

class ShapesPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..strokeWidth = 5
      ..color = Colors.indigoAccent
      ..style = PaintingStyle.stroke;
    drawTrianle(canvas, paint);

    drawSquareUsingLines(canvas, paint);

    final hexPaint = Paint()..color = Colors.green;
    drawHexagon(canvas, hexPaint);

    drawCross(canvas, paint);

    drawCircle(canvas, paint);

    drawCocentricCircles(canvas, paint);

    drawArch(canvas, paint);

    drawQuadraticBezierCurves(canvas, paint);

    drawCubicBezierCurves(canvas, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  void drawTrianle(Canvas canvas, Paint paint) {
    final triangle = Path();
    triangle.moveTo(150, 50);
    triangle.relativeLineTo(100, 100);
    triangle.relativeLineTo(-150, 0);
    triangle.close();

    canvas.drawPath(triangle, paint);
  }

  void drawSquareUsingLines(Canvas canvas, Paint paint) {
    final square1 = Path();
    // 1
    square1.moveTo(50, 200);
    // 2
    square1.relativeLineTo(100, 0);
    // 3
    square1.relativeLineTo(0, 100);
    // 4
    square1.relativeLineTo(-100, 0);
    // 5
    square1.close();

    canvas.drawPath(square1, paint);

    const square2 = Rect.fromLTWH(200, 200, 100, 100);
    canvas.drawRect(square2, paint);
  }

  void drawHexagon(Canvas canvas, Paint paint) {
    final hexagon = Path()
      // 1
      ..moveTo(175, 350)
      // 2
      ..relativeLineTo(75, 50)
      // 3
      ..relativeLineTo(0, 75)
      // 4
      ..relativeLineTo(-75, 50)
      // 5
      ..relativeLineTo(-75, -50)
      // 6
      ..relativeLineTo(0, -75)
      // 7
      ..close();
    canvas.drawPath(hexagon, paint);
  }

  void drawCross(Canvas canvas, Paint paint) {
    final cross = Path()
      ..moveTo(150, 550)
      ..relativeLineTo(50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, 50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, -50)
      ..relativeLineTo(-50, 0)
      ..relativeLineTo(0, -50)
      ..relativeLineTo(50, 0)
      ..close();
    canvas.drawPath(cross, paint);
  }

  void drawCircle(Canvas canvas, Paint paint) {
    final circle = Path();
    const circleRadius = 75.0;
    const circleCenter = Offset(450, 150);
    canvas.drawCircle(circleCenter, circleRadius, paint);
    canvas.drawPath(circle, paint);

    const ovalCenter = Offset(450, 275);
    final oval = Rect.fromCenter(center: ovalCenter, width: 200, height: 100);
    canvas.drawOval(oval, paint);
  }

  void drawCocentricCircles(Canvas canvas, Paint paint) {
    var concentricCircleRadius = 120.0;
    const center = Offset(450, 500);
    while (concentricCircleRadius > 0) {
      canvas.drawCircle(center, concentricCircleRadius, paint);
      concentricCircleRadius -= 15;
    }
  }

  double degreesToRadians(double degrees) {
    return degrees * (3.1415 / 180);
  }

  void drawArch(Canvas canvas, Paint paint) {
    const arcCenter = Offset(650, 80);

    final arcRect = Rect.fromCircle(center: arcCenter, radius: 75);

    // The start angle begins at the x-axis on the circle,
    final startAngle = degreesToRadians(0);

    // The sweep angle is how much of the circle we want to draw.
    // use -90 to draw arc counter clockwie
    final sweepAngle = degreesToRadians(110);

    // true means that the arc contains radii connecting the endpoints of the arc
    canvas.drawArc(arcRect, startAngle, sweepAngle, true, paint);
  }

  void drawQuadraticBezierCurves(Canvas canvas, Paint paint) {
    final qCurve1 = Path()
      // Here move to is the anchor/control point
      ..moveTo(600, 300)
      // x1,y1,x2,y2 are the ends of the curve
      ..relativeQuadraticBezierTo(100, -100, 300, 0);
    canvas.drawPath(qCurve1, paint);

    final qCurve2 = Path()
      ..moveTo(600, 350)
      ..relativeQuadraticBezierTo(150, 300, 300, 100);
    canvas.drawPath(qCurve2, paint);
  }

  void drawCubicBezierCurves(Canvas canvas, Paint paint) {
    final cCurve1 = Path()
      ..moveTo(950, 150)
      ..relativeCubicTo(50, -100, 250, -100, 300, 0);
    canvas.drawPath(cCurve1, paint);

    // A and B are end points of the curve
    // C and D are the control points of A and B
    final cCurve2 = Path()
      // This is point A on the curve
      ..moveTo(1200, 200)
      // x1,y1 gives point C
      // x2,y2 gives point D
      // x3,y3 gives point B
      ..relativeCubicTo(0, 450, -300, 300, -150, 250);
    canvas.drawPath(cCurve2, paint);

    final curve3 = Path()
      // This is point A on the curve
      ..moveTo(1000, 650)
      // x1,y1 gives point C
      // x2,y2 gives point D
      // x3,y3 gives point B
      ..relativeCubicTo(0, -100, 200, -100, 200, 0);
    canvas.drawPath(curve3, paint);
  }
}
