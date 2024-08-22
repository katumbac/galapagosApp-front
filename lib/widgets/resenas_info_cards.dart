import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/texto_cards.dart';

class ResenasInfoCards extends StatefulWidget {
  const ResenasInfoCards({super.key});

  @override
  State<ResenasInfoCards> createState() => _ResenasInfoCardsState();
}

class _ResenasInfoCardsState extends State<ResenasInfoCards> {
  List<Map<String,String>> resenas = [
    {'nombre': 'rochardd', 'texto': 'comidas ricas', 'fecha': '2024-01-01', 'hora': '17:00'},
    {'nombre': 'pepito', 'texto': 'me gustan los cocteles', 'fecha': '2024-01-01', 'hora': '8:00'},
    {'nombre': 'lacobra', 'texto': 'BOEEEEEE', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'davo', 'texto': 'mala atencion, no volvere nunca mas en mi vida :)', 'fecha': '2024-01-01', 'hora': '5:00'},
    {'nombre': 'usuario1', 'texto': 'no se que poner', 'fecha': '2024-01-01', 'hora': '14:00'},
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