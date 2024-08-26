import 'package:flutter/material.dart';

class DataFont extends StatelessWidget {
  final String dataTitulo;
  final String dataContenido;
  const DataFont({super.key, required this.dataTitulo, required this.dataContenido});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text:  TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 17.0
        ),
        children: <TextSpan>[
          TextSpan(text: dataTitulo, style:  const TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: dataContenido)
        ]
      )
    );
  }
}