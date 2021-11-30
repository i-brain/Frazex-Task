import 'package:flutter/material.dart';

import 'package:task/constants/routes.dart';
import 'package:task/data/models/response/image_response.dart';
import 'package:task/presentation/pages/details/image_details_page.dart';
import 'package:task/presentation/pages/home/home_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.imageDetails:
        return MaterialPageRoute(
          builder: (_) => ImageDetailsPage(
              imageResponse: settings.arguments as ImageResponse),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
