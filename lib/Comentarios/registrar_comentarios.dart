import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class RegistrarComentario extends StatefulWidget {
  final int usuario;
  const RegistrarComentario({super.key, required this.usuario});

  @override
  State<RegistrarComentario> createState() =>_RegistrarComentarioState();
}

class _RegistrarComentarioState extends State<RegistrarComentario> {

  final TextEditingController _comentario = TextEditingController();
  int number = 0;

  @override
  void dispose() {
    _comentario.dispose();
    super.dispose();
  }

  Future<void> postComentario() async {
      try{
        if(_comentario.text == ''){
          throw Exception();
        }
        var response = await Dio().post('$urlBack/comentario/crear_comentario//',
          data: {
            'usuario': Credenciales.idUsuario,
            'comentario' : _comentario.text,
          }
        ); 
        if (response.statusCode == 201) {
          setState(() {number = 1;}); 
        }
      }
      catch (e) {
        if (e is DioException) {
          print('Error peticion');
        }
      }
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: "Registrar Comentario",
        back: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextField(
                maxLength: 200,
                maxLines: 17,
                controller: _comentario,
                decoration: InputDecoration(
                  hintText: 'Escriba su comentario',
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                )
              ),
            ),
            const SizedBox(height: 50),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colorbuttonGreen,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () async {
                await postComentario();
                if(number == 0){
                  Navigator.pop(context,'POST no realizado, exception');
                  }
                else{
                  Navigator.pop(context,'POST realizado');
                }  
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text("REGISTRAR",
                  style: TextStyle(
                    fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        )
      )
    );
  }
}
