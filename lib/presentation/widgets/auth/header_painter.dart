import 'package:flutter/material.dart';

class HeaderPainter extends StatelessWidget {
  const HeaderPainter({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomPaint(
          size: Size(MediaQuery.of(context).size.width, 180),
          painter: _HeaderPainter(),
        ),
        Positioned(
          bottom: 20,
          left: 0,
          right: 0,
          child: Center(
            child: Image.asset(
              'assets/logo/cinemapedialogo.png',
              height: 110, // Ajusta el tamaño del logo según sea necesario
            ),
          ),
        ),
      ],
    );
  }
}

class _HeaderPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color(0xFF143447), Color(0xFF0F2533)],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path()
      ..lineTo(0, size.height * 0.75)
      ..quadraticBezierTo(
        size.width * 0.5, size.height * 1.4, // Punto de curvatura
        size.width, size.height * 0.75,
      )
      ..lineTo(size.width, 0)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
