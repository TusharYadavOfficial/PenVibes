import 'package:flutter/material.dart';

class ScreenLayout {
  static bool isMobile(context) => MediaQuery.of(context).size.width < 800;
}
