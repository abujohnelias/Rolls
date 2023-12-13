import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rollz/controller/theme_provider.dart';
import 'package:rollz/views/home_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice Roll',
      themeMode: Provider.of<ThemeProvider>(context).currentThemeMode,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
