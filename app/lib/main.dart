import 'package:flutter/material.dart';
import 'package:presenter/presenter.dart';
void main() {
  runApp(
    ModularApp(module: AppModule(), child: const AppWidget())
  );
}

