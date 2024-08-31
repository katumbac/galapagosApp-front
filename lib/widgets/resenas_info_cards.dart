/*import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/texto_cards.dart';
import 'package:exploregalapagos/models/resena.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/shared/constants.dart';

class ResenasInfoCards extends StatefulWidget {
  final int idNegocio;

  const ResenasInfoCards({super.key, required this.idNegocio});

  @override
  State<ResenasInfoCards> createState() => _ResenasInfoCardsState();
}

class _ResenasInfoCardsState extends State<ResenasInfoCards> {
  List<Map<String,String>> resenas = [
    {'nombre': 'rochardd', 'texto': 'comidas ricas', 'fecha': '2024-01-01', 'hora': '17:00'},
    {'nombre': 'pepito', 'texto': 'me gustan los cocteles', 'fecha': '2024-01-01', 'hora': '8:00'},
    {'nombre': 'lacobra', 'texto': 'BOEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEEE', 'fecha': '2024-01-01', 'hora': '21:00'},
    {'nombre': 'davo', 'texto': 'mala atencion, no volvere nunca mas en mi vida :)', 'fecha': '2024-01-01', 'hora': '5:00'},
    {'nombre': 'usuario1', 'texto': 'no se que poner', 'fecha': '2024-01-01', 'hora': '14:00'},
  ];

  List<Resena>? listaResenas;
  late String idN;
  String textoMostrar = 'Cargando.....';

  @override
  void initState() {
    super.initState();
    idN = widget.idNegocio.toString();
    getResenas();
  }

  Future<void> getResenas() async {
    try{
      var response = await Dio().get('$urlBack/resena/id_negocio/$idN/'); 
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        listaResenas = data.map((json) => Resena.fromJson(json)).toList();
        print(listaResenas!.length.toString());
        setState(() {}); 
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
        setState(() {
        textoMostrar = 'Sin resenas!!!';
      });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(listaResenas != null && listaResenas!.length >0){
    return Expanded(
      child: ListView.builder(
        itemCount: listaResenas!.length,
        itemBuilder: (context, index) => TextoCards(
          nombre: listaResenas![index].usuario.nickname,
          texto: listaResenas![index].descripcion,
          fecha: "${listaResenas![index].fecha.year}-${listaResenas![index].fecha.month}-${listaResenas![index].fecha.day}",
          hora: listaResenas![index].hora,
        )
      )
    );}
    else{
      return Text(textoMostrar);
    }
  }
}*/