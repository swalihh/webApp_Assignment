import 'package:assignment_one/screens/settings_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
              elevation: 2,
              shadowColor: Colors.black,
              iconTheme: IconThemeData(color: Colors.black))),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
