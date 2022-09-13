import 'package:flutter/cupertino.dart';

class Theme {
  const Theme();

  static const Color gradientStart = const Color(0xFF120C4E);
  static const Color gradientEnd = const Color(0xFF154F7E);

  static const gradient = const LinearGradient(
    colors: [gradientStart, gradientEnd],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 1.0],
  );
}
