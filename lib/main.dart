import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/features/auth/screens/auth_screen.dart';
import 'package:ecommproject/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'MyApp',
        theme: ThemeData(
            scaffoldBackgroundColor: GlobalVariables.backgroundColor,
            colorScheme: const ColorScheme.light(
                primary: GlobalVariables.secondaryColor),
            appBarTheme: const AppBarTheme(
                elevation: 0, iconTheme: IconThemeData(color: Colors.black))),
        debugShowCheckedModeBanner: false,
        onGenerateRoute: (settings) => generateRoutes(settings),
        home: const AuthScreen());
  }
}