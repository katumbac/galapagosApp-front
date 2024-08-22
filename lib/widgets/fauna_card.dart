import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/data_font.dart';

class FaunaCard extends StatelessWidget {
  final String nombreComun;
  final String nombreCientifico;
  final String datoCurioso;
  final String habitat;
  final String alimentacion;
  final String linkImagen;

  const FaunaCard({super.key, required this.nombreComun, required this.nombreCientifico, required this.datoCurioso, required this.habitat, 
    required this.alimentacion, required this.linkImagen});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 10.0),
        decoration: BoxDecoration(
          border: Border.all(color: colorbuttonGreen, width: 3.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            SizedBox(height: 20),
            Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: const DecorationImage(
                  image: NetworkImage('https://content.nationalgeographic.com.es/medio/2024/02/05/tortuga-gigante-galapagos_2a766ad7_240205124113_800x533.jpg'),
                  // image: AssetImage('assets/imagen_local.jpg'), // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 350,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataFont(dataTitulo: "Nombre común: ", dataContenido: nombreComun),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Nombre científico: ", dataContenido: nombreCientifico),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Hábitat: ", dataContenido: habitat),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Alimentación: ", dataContenido: alimentacion),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Dato curioso: ", dataContenido: datoCurioso),      
                ],
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
