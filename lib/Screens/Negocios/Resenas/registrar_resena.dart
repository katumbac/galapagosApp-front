import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/Screens/Negocios/Resenas/resenas.dart';


class RegistrarResena extends StatefulWidget {
  final int idNegocio;
  const RegistrarResena({super.key, required this.idNegocio});

  @override
  State<RegistrarResena> createState() =>_RegistrarResenaState();
}

class _RegistrarResenaState extends State<RegistrarResena> {

  final TextEditingController _resena = TextEditingController();
  int number = 0;

  @override
  void dispose() {
    _resena.dispose();
    super.dispose();
  }

  Future<void> postResena() async {
      try{
        if(_resena.text == ''){
          throw Exception();
        }
        var response = await Dio().post('$urlBack/resena/crear_resena//',
          data: {
            'negocio': widget.idNegocio,
            'usuario': Credenciales.idUsuario,
            'descripcion' : _resena.text,
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
        title: "Registrar Reseña",
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
                controller: _resena,
                decoration: InputDecoration(
                  hintText: 'Escriba su reseña',
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
                await postResena();
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
