import 'package:flutter/material.dart';
import 'package:flutter_canvas_examples/grid.dart';
import 'package:flutter_canvas_examples/shapes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          body: Builder(
        builder: (context) => CustomPaint(
          painter: GridPainter(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              rulerOffset: Offset(30, 30),
              gridOffset: Offset(50, 50)),
          foregroundPainter: ShapesPainter(),
        ),
      )),
    );
  }
}
