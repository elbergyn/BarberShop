import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:barbershop/src/barbershop_app.dart';

void main() {
  runApp(const ProviderScope(child: BarbershopApp()));
}
