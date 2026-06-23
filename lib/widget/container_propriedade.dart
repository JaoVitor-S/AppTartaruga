import 'package:flutter/material.dart';

class ContainerPropriedade extends StatefulWidget {
  final dynamic propriedade; // o banco vai fornecer os dados

  const ContainerPropriedade({super.key, required this.propriedade});

  @override
  State<ContainerPropriedade> createState() => _ContainerPropriedadeState();
}

class _ContainerPropriedadeState extends State<ContainerPropriedade> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10, right: 10, bottom: 15),
      height: 80,
      width: 320,
      decoration: BoxDecoration(
        border: Border.all(width: 1, color: Colors.black12),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 10)),
              Text(
                "\t\t${widget.propriedade.materia}",
                textAlign: TextAlign.justify,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              Text(
                "\t\tPrazo: ${widget.propriedade.prazo}",
                style: const TextStyle(
                  color: Colors.black45,
                  fontSize: 13,
                ),
              ),
            ],
          ),
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(bottom: 29)),
              const Text(
                "Pendente    ",
                style: TextStyle(
                  backgroundColor: Colors.black12,
                  color: Color(0xFF1E3050),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
