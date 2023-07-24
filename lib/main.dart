import 'package:ecommproject/constants/global_variables.dart';
import 'package:ecommproject/features/auth/screens/auth_screen.dart';
import 'package:ecommproject/features/auth/services/auth_service.dart';
// import 'package:ecommproject/features/home/screen/home_screen.dart';
import 'package:ecommproject/providers/user_provider.dart';
import 'package:ecommproject/routes.dart';
import 'package:ecommproject/widgets/bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _authService.validateToken(context: context);
  }

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
        home: Provider.of<UserProvider>(context).user.token.isNotEmpty
            ? const BottomBar()
            : const AuthScreen());
  }
}
