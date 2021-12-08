import 'package:flutter/material.dart';

import 'package:task/constants/routes.dart';
import 'package:task/data/models/response/image_body.dart';
import 'package:task/presentation/pages/home/home_page.dart';
import 'package:task/presentation/pages/image_details/image_details_page.dart';

class AppRouter {
  AppRouter._();

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.home:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
      case Routes.imageDetails:
        return PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              ImageDetailsPage(
                  imageResponse: settings.arguments as ImageResponse),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0);
            const end = Offset.zero;
            const curve = Curves.ease;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const HomePage(),
        );
    }
  }
}
// ImageDetailsPage(
//               imageResponse: settings.arguments as ImageResponse)

//   return PageRouteBuilder(
//     pageBuilder: (context, animation, secondaryAnimation) => const Page2(),
//     transitionsBuilder: (context, animation, secondaryAnimation, child) {
//       const begin = Offset(1.0, 0.0);
//       const end = Offset.zero;
//       const curve = Curves.ease;

//       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

//       return SlideTransition(
//         position: animation.drive(tween),
//         child: child,
//       );
//     },
//   );
