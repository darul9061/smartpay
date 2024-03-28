import 'package:flutter/material.dart';

extension mediaSize on BuildContext {
  double get screenHeight => MediaQuery.of(this).size.height;

  double get screenWidth => MediaQuery.of(this).size.width;

  TextTheme get textSize => Theme.of(this).textTheme;
}
