import 'package:attendsync/routes/app_pages.dart';
import 'package:flutter/material.dart';

class AttendsyncApp extends StatelessWidget {
  const AttendsyncApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Attendsync',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent,
        ),
        useMaterial3: true,
        pageTransitionsTheme: const PageTransitionsTheme(
          builders: {
            TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
            TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          },
        ),
      ),
      initialRoute: AppPages.INITIAL,
      routes: AppPages.routes,
      
    );
  }
}
