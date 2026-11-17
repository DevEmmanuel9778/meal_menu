import 'package:flutter/material.dart';

import 'package:meal_menu/view/home_scrn.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MealCategoriesApp());
}

class MealCategoriesApp extends StatelessWidget {
  const MealCategoriesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meal Categories',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepOrange,
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
