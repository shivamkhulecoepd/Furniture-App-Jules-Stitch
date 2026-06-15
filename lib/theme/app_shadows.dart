import 'package:flutter/material.dart';

class AppShadows {
  static List<BoxShadow> get soft => [
    BoxShadow(
      color: Colors.black.withOpacity(0.04),
      blurRadius: 30,
      offset: const Offset(0, 10),
    ),
  ];

  static List<BoxShadow> get cardBorder => [
    BoxShadow(
      color: const Color(0xFFEEEEEE).withOpacity(0.5),
      blurRadius: 0,
      spreadRadius: 1,
    ),
    ...soft,
  ];
}
