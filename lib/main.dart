import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:basic_coffee/screens/home_screen.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Basic Coffee Redeem',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        scaffoldBackgroundColor: Colors.white,
        textTheme: GoogleFonts.interTextTheme(),   
      ),
      home: const HomeScreen(),
    );
  }
}
