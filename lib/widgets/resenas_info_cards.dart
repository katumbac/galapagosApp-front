import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/texto_cards.dart';

class ResenasInfoCards extends StatefulWidget {
  const ResenasInfoCards({super.key});

  @override
  State<ResenasInfoCards> createState() => _ResenasInfoCardsState();
}

class _ResenasInfoCardsState extends State<ResenasInfoCards> {
  List<Map<String,String>> resenas = [
    {'nombre': 'rochardd', 'texto': 'comidas ricas', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'pepito', 'texto': 'cocteles', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'lacobra', 'texto': 'BOEEEEEE', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'jes', 'texto': 'cocteles', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'asd', 'texto': 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'fecha': '2024-01-01', 'hora': '21:00'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: resenas.length,
        itemBuilder: (context, index) => TextoCards(
          nombre: resenas[index]['nombre']!,
          texto: resenas[index]['texto']!,
          fecha: resenas[index]['fecha']!,
          hora: resenas[index]['hora']!,
        )
      )
    );
  }
}