import 'package:exploregalapagos/Comentarios/registrar_comentarios.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/texto_cards.dart';
import 'package:flutter/material.dart';

class ComentariosScreen extends StatefulWidget {
  final int usuario;

  const ComentariosScreen({super.key, required this.usuario});


  @override
  _ComentariosScreenState createState() => _ComentariosScreenState();
}

class _ComentariosScreenState extends State<ComentariosScreen> {

  List<Map<String,String>> comentarios = [
    {'nombre': 'rochardd', 'texto': 'comidas ricas', 'fecha': '2024-01-01', 'hora': '17:00'},
    {'nombre': 'pepito', 'texto': 'me gustan los cocteles', 'fecha': '2024-01-01', 'hora': '8:00'},
    {'nombre': 'lacobra', 'texto': 'BOEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'davo', 'texto': 'mala atencion, no volvere nunca mas en mi vida :)', 'fecha': '2024-01-01', 'hora': '5:00'},
    {'nombre': 'usuario1', 'texto': 'no se que poner', 'fecha': '2024-01-01', 'hora': '14:00'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "EXPLOREGALÁPAGOS."),
      body: Column(
        children: [
            const Text(
              'Comentarios',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: colorbuttonGreen,
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: comentarios.length,
                  itemBuilder: (context, index) => TextoCards(
                    nombre: comentarios[index]['nombre']!,
                    texto: comentarios[index]['texto']!,
                    fecha: comentarios[index]['fecha']!,
                    hora: comentarios[index]['hora']!,
                  )
                )
              ),   
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.maps_ugc_outlined),
                color: const Color.fromARGB(255, 59, 66, 60),
                iconSize: 55.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>  RegistrarComentario(usuario: widget.usuario)));
                },
              ),
              const SizedBox(width: 25)
            ],
          ),
        ],
        
      ),
    );
  }
}
