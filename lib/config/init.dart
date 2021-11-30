import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:task/config/configs.dart';
import 'package:task/data/data_sources/image_data_source.dart';

final locator = GetIt.I;

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: Configs.baseUrl,
      contentType: 'application/json',
    ),
  );

  locator.registerSingleton<ImageDataSource>(ImageDataSource(dio));
}
