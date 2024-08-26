import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/data_font.dart';


class GuiaCard extends StatelessWidget {
  final int idGuia;
  final String nombre;
  final int edad;
  final String telefono;
  final String linkImagen;
  final String isla;

  const GuiaCard({super.key, required this.idGuia, required this.nombre, required this.edad, required this.telefono, 
    required this.linkImagen, required this.isla,});

  @override
  Widget build(BuildContext context) {
    return Card.outlined(
        margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: colorbuttonGreen,
            width: 2.0,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 15,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              width: 200,
              height: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(linkImagen),
                  // image: AssetImage('assets/imagen_local.jpg'), // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              //width: 325,
              margin: const EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataFont(dataTitulo: "Nombre: ", dataContenido: nombre),
                  const SizedBox(height: 9),
                  DataFont(dataTitulo: "Edad: ", dataContenido: edad.toString()),
                  const SizedBox(height: 9),
                  DataFont(dataTitulo: "Teléfono: ", dataContenido: telefono),
                  const SizedBox(height: 9),
                  DataFont(dataTitulo: "Isla: ", dataContenido: isla),
                  const SizedBox(height: 9),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: 1)
                    ],
                  )   
                ],
              )
            ),
          ],
        )
    );
  }
}
