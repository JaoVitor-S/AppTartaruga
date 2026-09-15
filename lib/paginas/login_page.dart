import 'package:flutter/material.dart';
import 'package:assistentemovel/api/user_api.dart';
import 'package:assistentemovel/db/shared_prefs.dart';
import 'perfi.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  static const Color azul = Color(0xFF1E3050);
  static const Color bg = Color(0xFFF6F7FB);

  SharedPrefs prefs = SharedPrefs();
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg,
        body: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Icon(Icons.school, size: 80, color: azul),
              const SizedBox(height: 24),
              const Text(
                'Entre no Sistema',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold, color: azul),
              ),
              const SizedBox(height: 24),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hintText: 'Usuário',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: buildUserOutlineInputBorder(),
                  border: buildUserOutlineInputBorder(),
                ),
              ),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: 'Senha',
                  fillColor: Colors.white,
                  filled: true,
                  focusedBorder: buildPasswordOutlineInputBorder(),
                  border: buildPasswordOutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: azul,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),

                onPressed: onPressed,
                child: Text(
                  'Entrar',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  onPressed() async {
    String username = userController.text;
    String password = passwordController.text;

    //api fake
    bool isAuth = await UserApi().login(username, password);

    if (isAuth) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return Perfil();
          },
        ),
      );
      prefs.setUserStatus(true);
      prefs.setUsername(username);
    } else {
      print('Usuario e/ou senha incorretos');
    }
  }

  buildPasswordOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(bottom: Radius.circular(8)),
    );
  }

  buildUserOutlineInputBorder() {
    return OutlineInputBorder(
      borderSide: BorderSide(color: Colors.grey),
      borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
    );
  }
}