import 'package:flutter/material.dart';
import 'package:movies_app/core/api/api_manager/api_manager.dart';
import 'core/DI/di.dart';
import 'my_app.dart';

void main() {
  configureDependencies();
  ApiManager.init();
  runApp(const MyApp());
}