import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> get soft => [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      offset: Offset(0, 10),
      blurRadius: 30,
    ),
  ];

  static List<BoxShadow> get bottomNav => [
    const BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.04),
      offset: Offset(0, -10),
      blurRadius: 30,
    ),
  ];
}
