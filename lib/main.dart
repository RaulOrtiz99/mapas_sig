import 'package:flutter/material.dart';
import 'package:mapas/app/ui/pages/home/homepage.dart';
import 'package:mapas/app/ui/routes/pages.dart';

import 'app/ui/routes/routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: Routes.SPLASH,
      routes: appRoutes(),
    );
  }
}
