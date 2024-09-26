import 'package:flutter/material.dart';
import 'home.dart'; // Importa o arquivo com a tela

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaPrincipal(),
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          backgroundColor: Color(0xFF301c41),
          selectedItemColor: Color(0xFF6f95ff),
          unselectedItemColor: Color(0xFF5c65c0),
        ),
      ),
    );
  }
}
