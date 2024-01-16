import 'package:attendsync/pages/admin/home_admin_page.dart';
import 'package:attendsync/pages/auth/login_page.dart';
import 'package:attendsync/pages/splash_screen.dart';
import 'package:attendsync/routes/app_routes.dart';
import 'package:flutter/material.dart';

class AppPages {
  static String INITIAL = AppRoutes.SPLASH;
  
  static Map<String, WidgetBuilder> routes = {
    INITIAL: (context) => SplashScreen(),
    AppRoutes.LOGIN: (context) => LoginPage(),
    AppRoutes.HOME: (context) => HomeAdminPage(),
  };
}