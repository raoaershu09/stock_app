import 'package:flutter/material.dart';

import 'package:stockish/ui/admin_page.dart';

import 'package:stockish/ui/login.dart';

import 'package:stockish/utils/routes.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: MyRoutes.loginRoute,
      routes: {
        MyRoutes.loginRoute: (context) => LoginPage(),
        MyRoutes.adminRoute: (context) => AdminPage(),
      },
    );

  }
}