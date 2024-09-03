import 'package:exploregalapagos/Comentarios/registrar_comentarios.dart';
import 'package:exploregalapagos/models/comentario.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/texto_cards.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class ComentariosScreen extends StatefulWidget {
  final int usuario;

  const ComentariosScreen({super.key, required this.usuario});


  @override
  _ComentariosScreenState createState() => _ComentariosScreenState();
}

class _ComentariosScreenState extends State<ComentariosScreen> {

  List<Comentario>? listaComentarios;
  late String idUsuario;
  String textoMostrar = 'Cargando.....';

  @override
  void initState() {
    super.initState();
    idUsuario = widget.usuario.toString();
    getComentarios();
  }

  Future<void> getComentarios() async {
    try{
      var response = await Dio().get('$urlBack/comentario/obtener_comentarios/'); 
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        listaComentarios = data.map((json) => Comentario.fromJson(json)).toList();
        setState(() {}); 
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
        setState(() {
        textoMostrar = 'No existen comentarios para mostrar';
      });
      }
    }
  }




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
            if(listaComentarios != null && listaComentarios!.isNotEmpty)
              Expanded(
                child: ListView.builder(
                  itemCount: listaComentarios!.length,
                  itemBuilder: (context, index) => TextoCards(
                    nombre: listaComentarios![index].usuario.nickname,
                    texto: listaComentarios![index].comentario,
                    fecha: "${listaComentarios![index].fecha.year}-${listaComentarios![index].fecha.month}-${listaComentarios![index].fecha.day}",
                    hora: "${listaComentarios![index].hora.split(":")[0]}:${listaComentarios![index].hora.split(":")[1]}"
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
                    builder: (context) =>  RegistrarComentario(usuario: widget.usuario)));
                  if (resultado != null) {
                    print("Resultado recibido: $resultado");
                    setState(() {
                      getComentarios();
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
        
      ),
    );
  }
}
