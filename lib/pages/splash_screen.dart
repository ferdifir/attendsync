import 'package:attendsync/routes/app_routes.dart';
import 'package:attendsync/services/hive/hive_service.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    bool isUserLoggedIn = HiveService.isUserLoggedIn();
    String routeName = isUserLoggedIn ? AppRoutes.HOME : AppRoutes.LOGIN;
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image.network(
          'https://upload.wikimedia.org/wikipedia/commons/thumb/1/17/Google-flutter-logo.png/600px-Google-flutter-logo.png',
          width: 300,
          height: 300,
        ),
      ),
    );
  }
}