import 'package:flutter/material.dart';
import 'fitness_home_page.dart';
import 'cadastro_page.dart';
import 'login_page.dart';
import 'formulario_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fitness App',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const FitnessHomePage(),
        '/cadastro': (context) => const CadastroPage(),
        '/login': (context) => const LoginPage(),
        '/formulario_page': (context) => const GenderPage(),
      },
    );
  }
}