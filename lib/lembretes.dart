import 'package:flutter/material.dart';
import 'lembrete.dart';
import 'lembrete_dao.dart';
import 'editlembretes.dart';
import 'adclembretes.dart';
import 'quote.dart';
import 'quote_api.dart';

class Lembretes extends StatefulWidget {
  const Lembretes({super.key});

  @override
  State<Lembretes> createState() => _LembretesState();
}

class _LembretesState extends State<Lembretes> {
  List<Lembrete> listaLembretes = [];
  late Future<Quote> futureFrase;

  @override
  void initState() {
    super.initState();
    loadData();

    futureFrase = QuoteApi().buscarFraseMotivacional();
  }

  loadData() async {
    listaLembretes = await LembreteDao().listarLembretes();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF0D47A1),
        title: const Text(
          "Assistente Acadêmico",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [


            FutureBuilder<Quote>(
              future: futureFrase,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(child: CircularProgressIndicator()),
                    ),
                  );
                }


                if (snapshot.hasError) {
                  return Card(
                    color: Colors.red.shade50,
                    child: const Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        "Não foi possível carregar a frase da API.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  );
                }


                if (snapshot.hasData) {
                  final quote = snapshot.data!;
                  return Card(
                    color: const Color(0xFFE3F2FD),
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              Icon(Icons.format_quote, color: Color(0xFF0D47A1)),
                              SizedBox(width: 8),
                              Text(
                                "Frase Motivação do Dia",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFF0D47A1),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '"${quote.text}"',
                            style: const TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Text(
                              "- ${quote.author}",
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }


                return const SizedBox.shrink();
              },
            ),
            const SizedBox(height: 16),


            Expanded(
              child: ListView.builder(
                itemCount: listaLembretes.length,
                itemBuilder: (context, i) {
                  final lembrete = listaLembretes[i];
                  return Card(
                    child: ListTile(
                      title: Text(lembrete.titulo),
                      subtitle: Text("${lembrete.horario}\n${lembrete.data}"),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit, color: Colors.grey),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => EditLembretes(lembrete: lembrete),
                                ),
                              ).then((_) => loadData());
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () async {
                              await LembreteDao().deletarLembrete(lembrete.id!);
                              loadData();
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (_) => AdcLembretes()),
          ).then((_) => loadData());
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}