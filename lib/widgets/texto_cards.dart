import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';

class TextoCards extends StatelessWidget {
  final String nombre;
  final String texto;
  final String fecha;
  final String hora;

  const TextoCards({super.key, required this.nombre, required this.texto, required this.fecha, required this.hora});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        margin: const EdgeInsets.fromLTRB(40.0, 10.0, 40.0, 10.0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: colorbuttonGreen,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const SizedBox(width: 10),
                    const Icon(Icons.calendar_month),
                    Text(fecha, style: const TextStyle(fontSize: 17))
                  ],
                ),
                Row(
                  children: [
                    const Icon(Icons.access_time),
                    Text(hora, style: const TextStyle(fontSize: 17)),
                    const SizedBox(width: 15),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(width: 13),
                Text(nombre, style: const TextStyle(
                  fontWeight: FontWeight.bold, fontSize: 20))
              ],
            ),
            const SizedBox(height: 20),
            Container( 
              margin: const EdgeInsets.fromLTRB(15.0, 0.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(texto, style: const TextStyle(fontSize: 15),),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 1)
                    ],
                  )
                ]
              )
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 20)
              ],
            )
          ],
        )
    );
  }
}
