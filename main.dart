// import 'dart:js';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ssb_ecommerce/common/widgets/bottom_bar.dart';
import 'package:ssb_ecommerce/features/admin/screens/admin_screen.dart';
import 'package:ssb_ecommerce/features/auth/screens/auth_screen.dart';
import 'package:ssb_ecommerce/features/auth/services/auth_service.dart';
import 'package:ssb_ecommerce/features/home/screen/home_screen.dart';
import 'package:ssb_ecommerce/provider/user_provider.dart';
import 'package:ssb_ecommerce/router.dart';

void main() {
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProvider())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  final AuthService authService = AuthService();

  // get user data function;  user app open kare tyare memory ma rhela data na aadhare home, auth,...screen bataave
  // jo memory ma data na hoy > means token null hoy to authantication ni screen bataave
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? Provider.of<UserProvider>(context).user.type == 'user'
              ? const HomeScreen()
              : const HomeScreen()
          : const HomeScreen(),
    );
  }
}
