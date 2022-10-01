import 'package:flutter/material.dart';

import '/pages/summary.dart';
import '/pages/home.dart';
import '/models/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        canvasColor: Colors.black12,
      ),
      routes: {
        AppRoutes.HOME: (ctx) => const HomePage(),
        AppRoutes.SUMMARY: (ctx) => const Summary(),
      },
    );
  }
}
