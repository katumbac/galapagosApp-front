import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/data_font.dart';

class NegocioCard extends StatelessWidget {
  final String nombreNegocio;
  final String servicios;
  final String horaInicio;
  final String horaFin;
  final String direccion;
  final String linkImagen;

  const NegocioCard({super.key, required this.nombreNegocio, required this.servicios, required this.horaInicio, 
    required this.horaFin, required this.direccion, required this.linkImagen});

  @override
  Widget build(BuildContext context) {
    String horario = "$horaInicio - $horaFin";
    return Container(
        margin: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
        decoration: BoxDecoration(
          border: Border.all(color: colorbuttonGreen, width: 3.0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
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
              margin: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DataFont(dataTitulo: "Nombre: ", dataContenido: nombreNegocio),
                  SizedBox(height: 5),
                  DataFont(dataTitulo: "Opciones de servicio: ", dataContenido: servicios),
                  SizedBox(height: 5),
                  DataFont(dataTitulo: "Horario: ", dataContenido: horario),
                  SizedBox(height: 5),
                  DataFont(dataTitulo: "Direccion: ", dataContenido: direccion),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          print('Botón presionado');
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
            )
          ],
        )
    );
  }
}
