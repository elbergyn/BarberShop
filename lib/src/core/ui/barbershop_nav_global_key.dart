import 'package:flutter/material.dart';

class BarbershopNavGlobalKey {
  final navKey = GlobalKey<NavigatorState>();

  static BarbershopNavGlobalKey? _instance;
  // Avoid self instance
  BarbershopNavGlobalKey._();
  static BarbershopNavGlobalKey get instance =>
      _instance ??= BarbershopNavGlobalKey._();
}
