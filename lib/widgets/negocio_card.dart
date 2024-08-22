import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/data_font.dart';
import 'package:exploregalapagos/Screens/Negocios/Resenas/resenas.dart';

class NegocioCard extends StatelessWidget {
  final int idNegocio;
  final String nombreNegocio;
  final String servicios;
  final String horaInicio;
  final String horaFin;
  final String direccion;
  final String linkImagen;

  const NegocioCard({super.key, required this.idNegocio, required this.nombreNegocio, required this.servicios, required this.horaInicio, 
    required this.horaFin, required this.direccion, required this.linkImagen});

  @override
  Widget build(BuildContext context) {
    String horario = "$horaInicio - $horaFin";
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
                  image: NetworkImage('https://concepto.de/wp-content/uploads/2021/01/isla-e1610153657243.jpg'),
                  // image: AssetImage('assets/imagen_local.jpg'), // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: 325,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataFont(dataTitulo: "Nombre: ", dataContenido: nombreNegocio),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Opciones de servicio: ", dataContenido: servicios),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Horario: ", dataContenido: horario),
                  SizedBox(height: 9),
                  DataFont(dataTitulo: "Direccion: ", dataContenido: direccion),   
                ],
              )
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>  ResenasScreen(idNegocio: idNegocio, nombreNegocio: nombreNegocio, linkImagen: linkImagen)));
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: colorbuttonGreen,
                  ),
                  child: Text('Reseñas...'),
                )
              ]
            )
          ],
        )
    );
  }
}
