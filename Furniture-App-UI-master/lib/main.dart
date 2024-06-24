import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'constants.dart';
import 'view/screens/home_screen.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Furniture App UI',
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: MaterialColor(
          primaryColor,
          <int, Color>{
            50: const Color(primaryColor).withOpacity(0.1),
            100: const Color(primaryColor).withOpacity(0.2),
            200: const Color(primaryColor).withOpacity(0.3),
            300: const Color(primaryColor).withOpacity(0.4),
            400: const Color(primaryColor).withOpacity(0.5),
            500: const Color(primaryColor).withOpacity(0.6),
            600: const Color(primaryColor).withOpacity(0.7),
            700: const Color(primaryColor).withOpacity(0.8),
            800: const Color(primaryColor).withOpacity(0.9),
            900: const Color(primaryColor).withOpacity(1.0),
          },
        ),
        fontFamily: 'Poppins',
      ),
      home: const HomeScreen(),
    );
  }
}
