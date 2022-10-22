import 'package:flutter/material.dart';

class SandClock extends CustomPainter {
  final double value;

  const SandClock({this.value = 0.0});
  @override
  void paint(Canvas canvas, Size size) {
    Paint stroke = Paint()
      ..color = Color(0xFFfab96e)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    Paint fill = Paint()
      ..color = Color(0xFFfab96e)
      ..style = PaintingStyle.fill;

    // Draw the flowing line..
    canvas.drawLine(Offset(size.width * 0.49, size.height * 0.5),
        Offset(size.width * 0.49, size.height * 0.6), stroke);

    stroke.color = Colors.red;

    //Decreasing the upper-side color
    Path upperSide = Path();
    upperSide.moveTo(size.width * 0.52, size.height * 0.5);
    upperSide.lineTo(size.width * (0.63 - value), size.height * (0.4 + value));
    upperSide.lineTo(size.width * (0.35 + value), size.height * (0.4 + value));
    upperSide.lineTo(size.width * 0.46, size.height * 0.5);
    canvas.drawPath(upperSide, fill);

    //Increasing the lower-side color
    Path lowerSide = Path();
    final double x = size.width * (0.36 + value);
    final double y = size.height * (0.6 - value);
    lowerSide.moveTo(size.width * (0.34), size.height * (0.6));
    lowerSide.lineTo(x, y);
    lowerSide.moveTo(size.width * 0.34, size.height * 0.6);
    lowerSide.lineTo(size.width * 0.64, size.height * 0.6);
    lowerSide.lineTo(size.width * (0.62 - value), size.height * (0.6 - value));
    lowerSide.lineTo(x, y);
    canvas.drawPath(lowerSide, fill);

    // Drawing the stroke line
    // lower side
    stroke.color = Color.fromARGB(255, 12, 12, 12);
    canvas.drawLine(Offset(size.width * 0.46, size.height * 0.5),
        Offset(size.width * 0.34, size.height * 0.6), stroke);
    canvas.drawLine(Offset(size.width * 0.34, size.height * 0.6),
        Offset(size.width * 0.64, size.height * 0.6), stroke);
    canvas.drawLine(Offset(size.width * 0.64, size.height * 0.6),
        Offset(size.width * 0.52, size.height * 0.5), stroke);

    //upper side
    canvas.drawLine(Offset(size.width * 0.52, size.height * 0.5),
        Offset(size.width * 0.64, size.height * 0.4), stroke);
    canvas.drawLine(Offset(size.width * 0.64, size.height * 0.4),
        Offset(size.width * 0.34, size.height * 0.4), stroke);
    canvas.drawLine(Offset(size.width * 0.34, size.height * 0.4),
        Offset(size.width * 0.46, size.height * 0.5), stroke);

    upperSide.close();
    lowerSide.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
