import 'package:flutter/material.dart';
import 'package:taskmanager/ui/screen/splash_screen.dart';

class Myapp extends StatelessWidget {
  const Myapp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Manager',
      theme: ThemeData(
        brightness: Brightness.light,
            primarySwatch: Colors.green,
        inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
        border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
          textTheme: TextTheme(
              titleLarge: TextStyle(
               fontSize: 24,
               fontWeight: FontWeight.w500,
               color: Colors.black,
          ),
          ),



        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 12),
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12)
            )
          )
        )
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark
      ),
      themeMode: ThemeMode.light,
      home: const SplachScreen(),
    );

  }
}