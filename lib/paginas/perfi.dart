import 'package:flutter/material.dart';
import 'package:assistentemovel/api/github_api.dart';
import 'package:assistentemovel/api/user_api.dart';
import 'package:assistentemovel/dominios/github_user.dart';
import 'package:assistentemovel/dominios/user.dart';
import 'package:assistentemovel/db/shared_prefs.dart';
import 'configuracoes.dart';
import 'login_page.dart';

class Perfil extends StatefulWidget {
  const Perfil({super.key});

  @override
  State<Perfil> createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  static const Color azul = Color(0xFF1E3050);
  int currentIndex = 3;

  SharedPrefs prefs = SharedPrefs();

  //nome do usuario do github:
  final String githubUsername = 'JaoVitor-S';
  late Future<GithubUser> futureUser;

  //usuario da API Fake que fez o login
  late Future<User> futureFakeUser;

  @override
  void initState() {
    super.initState();
    futureUser = GithubApi().buscarUsuario(githubUsername);
    futureFakeUser = _carregarUsuarioLogado();
  }

  //pega o username salvo no login e procura ele dentro da lista da API Fake
  Future<User> _carregarUsuarioLogado() async {
    String username = await prefs.getUsername();
    List<User> usuarios = await UserApi().buscarUsuarios();

    return usuarios.firstWhere(
          (u) => u.username == username,
      orElse: () => usuarios.first,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7FB),
      appBar: AppBar(
        backgroundColor: azul,
        centerTitle: true,
        title: const Text('Perfil', style: TextStyle(color: Colors.white)),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Configuracoes()),
                );
              },
              icon: const Icon(Icons.settings, color: Colors.white),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: IconButton(
              onPressed: logout,
              icon: const Icon(Icons.logout, color: Colors.white),
            ),
          ),
        ],
      ),
      body: FutureBuilder<GithubUser>(
        future: futureUser,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator(color: azul));
          }

          if (snapshot.hasError) {
            return Center(
              child: Text(
                'Erro ao carregar dados do GitHub.\nVerifique seu usuário.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.red.shade700),
              ),
            );
          }

          final user = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 36,
                      backgroundColor: azul.withOpacity(0.12),
                      backgroundImage: NetworkImage(user.avatarUrl),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            user.name,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '@${user.login}',
                            style: const TextStyle(fontSize: 13, color: Colors.grey),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            user.bio,
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: const Padding(
                        padding: EdgeInsets.all(6),
                        child: Icon(Icons.edit, color: Colors.black54),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    _statCard(
                      label: 'Repositórios\nGitHub',
                      value: '${user.publicRepos}',
                      color: azul,
                    ),
                    const SizedBox(width: 10),
                    _statCard(
                      label: 'Seguidores\nGitHub',
                      value: '${user.followers}',
                      color: azul,
                    ),
                  ],
                ),
                const SizedBox(height: 16),

                //bloco com os dados vindos da api fake
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Usuário (API Fake)', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),
                FutureBuilder<User>(
                  future: futureFakeUser,
                  builder: (context, snapshotFake) {
                    if (snapshotFake.connectionState == ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator(color: azul));
                    }

                    if (snapshotFake.hasError || !snapshotFake.hasData) {
                      return Text(
                        'Erro ao carregar usuário da API Fake.',
                        style: TextStyle(color: Colors.red.shade700),
                      );
                    }

                    final fakeUser = snapshotFake.data!;

                    return Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade200),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.verified_user, color: azul),
                          const SizedBox(width: 10),
                          Expanded(
                            child: Text(
                              fakeUser.username,
                              style: const TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////

                const SizedBox(height: 16),
                const Align(
                  alignment: Alignment.centerLeft,
                  child: Text('Dias sem atrasos', style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text('0 dias'),
                    Text('Meta: 30 dias', style: TextStyle(color: Colors.grey)),
                  ],
                ),
                const SizedBox(height: 10),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: LinearProgressIndicator(
                    value: 0.0,
                    minHeight: 10,
                    backgroundColor: Colors.grey.shade300,
                    valueColor: const AlwaysStoppedAnimation<Color>(azul),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        type: BottomNavigationBarType.fixed,
        selectedItemColor: azul,
        unselectedItemColor: azul.withOpacity(0.5),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.notifications_none), activeIcon: Icon(Icons.notifications), label: 'Lembretes'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_outlined), activeIcon: Icon(Icons.list_alt), label: 'Atividades'),
          BottomNavigationBarItem(icon: Icon(Icons.group_outlined), activeIcon: Icon(Icons.group), label: 'Grupos'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), activeIcon: Icon(Icons.person), label: 'Perfil'),
        ],
      ),
    );
  }

  logout() async {
    await prefs.setUserStatus(false);
    await prefs.setUsername('');

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return LoginPage();
        },
      ),
    );
  }

  Widget _statCard({required String label, required String value, required Color color}) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Column(
          children: [
            Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
            const SizedBox(height: 6),
            Text(label, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }
}