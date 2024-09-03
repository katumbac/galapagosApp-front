import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
//import 'package:exploregalapagos/widgets/resenas_info_cards.dart';
import 'package:exploregalapagos/Screens/Negocios/Resenas/registrar_resena.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/models/resena.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/texto_cards.dart';

class ResenasScreen extends StatefulWidget {
  final int idNegocio;
  final String nombreNegocio;
  final String linkImagen;
  const ResenasScreen({super.key, required this.idNegocio, required this.nombreNegocio, required this.linkImagen});

  @override
  State<ResenasScreen> createState() =>_ResenasScreenState();
}

class _ResenasScreenState extends State<ResenasScreen> {

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
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nombreNegocio,
        back: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(widget.linkImagen),
                  // image: AssetImage('assets/imagen_local.jpg'), // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          if(listaResenas != null && listaResenas!.isNotEmpty)
            Expanded(
                child: ListView.builder(
                  itemCount: listaResenas!.length,
                  itemBuilder: (context, index) => TextoCards(
                    nombre: listaResenas![index].usuario.nickname,
                    texto: listaResenas![index].descripcion,
                    fecha: "${listaResenas![index].fecha.year}-${listaResenas![index].fecha.month}-${listaResenas![index].fecha.day}",
                    hora: "${listaResenas![index].hora.split(":")[0]}:${listaResenas![index].hora.split(":")[1]}"
                  )
                )
              )
          else
            Text(textoMostrar),

          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.maps_ugc_outlined),
                color: const Color.fromARGB(255, 59, 66, 60),
                iconSize: 55.0,
                onPressed: () async {
                  final resultado = await Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>  RegistrarResena(idNegocio: widget.idNegocio)));
                  if (resultado != null) {
                    print("Resultado recibido: $resultado");
                    setState(() {
                      getResenas();
                    }); 
                  } else {
                    print("Sin resultado, regresa pantalla");
                  }
                  },
              ),
              const SizedBox(width: 25)
            ],
          ),
          const SizedBox(height: 10),
        ],
      )
    );
  }
}
