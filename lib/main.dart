import 'package:flutter/material.dart';
import 'package:task/config/init.dart';
import 'package:task/presentation/app.dart';

void main() async {
  await init();
  runApp(const MyApp());
}
