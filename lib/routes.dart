import 'package:ecommproject/features/admin/screens/add_product.dart';
import 'package:ecommproject/features/auth/screens/auth_screen.dart';
import 'package:ecommproject/features/home/screen/home_screen.dart';
import 'package:ecommproject/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';

Route<dynamic> generateRoutes(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routename:
      return MaterialPageRoute(builder: (_) => const AuthScreen());
    case HomeScreen.routename:
      return MaterialPageRoute(builder: (_) => const HomeScreen());
    case BottomBar.routename:
      return MaterialPageRoute(builder: (_) => const BottomBar());
    case AddProduct.routename:
      return MaterialPageRoute(builder: (_) => const AddProduct());
    default:
      return MaterialPageRoute(
          builder: (_) => const Scaffold(
                body: Center(
                  child: Text("Page not found"),
                ),
              ));
  }
}
