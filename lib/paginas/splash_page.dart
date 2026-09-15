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
  static const Color azul = Color(0xFF1E3050);

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    bool status = await prefs.getUserStatus();

    //tempo que a splash vai ficar na tela (3 segundos)
    await Future.delayed(const Duration(seconds: 3));

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
      backgroundColor: azul,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.school, size: 100, color: Colors.white),
            SizedBox(height: 24),
            CircularProgressIndicator(color: Colors.white),
          ],
        ),
      ),
    );
  }
}