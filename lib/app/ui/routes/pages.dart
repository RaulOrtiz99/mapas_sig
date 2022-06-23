


import 'package:flutter/material.dart';
import 'package:mapas/app/ui/pages/home/homepage.dart';
import 'package:mapas/app/ui/pages/request_permission/request_permission_page.dart';
import 'package:mapas/app/ui/pages/splash/splash_page.dart';
import 'package:mapas/app/ui/routes/routes.dart';

Map<String, Widget Function(BuildContext)> appRoutes(){
  return {
    Routes.SPLASH:(_)=> const SplashPage(),
    Routes.PERMISSIONS:(_)=> const RequestPermissionPage(),
    Routes.HOME:(_)=> const HomePage(),
  };
}