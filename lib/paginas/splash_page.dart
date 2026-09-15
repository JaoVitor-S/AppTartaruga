import 'package:flutter/material.dart';
import 'package:assistentemovel/db/shared_prefs.dart';
import 'perfi.dart';
import 'login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();
  static const Color azul = Color(0xFF1E3050); // Sua cor

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    bool status = await prefs.getUserStatus();

    // Tempo que a splash vai ficar na tela (3 segundos)
    await Future.delayed(const Duration(seconds: 5));

    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Perfil();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFE395C),
      body: Center(
        child: Image.network(
          'https://a0.muscache.com/pictures/09104ce1-4a66-4284-80b2-ad0ea3e46c24.jpg',
        ),
      ),
    );
  }
}