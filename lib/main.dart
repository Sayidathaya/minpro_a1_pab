import 'package:flutter/material.dart';
import 'theme/app_theme.dart';
import 'pages/home_page.dart';

void main() {
  runApp(const CineScopeApp());
}

class CineScopeApp extends StatelessWidget {
  const CineScopeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CineScope',
      theme: AppTheme.darkTheme,
      home: const HomePage(),
    );
  }
}