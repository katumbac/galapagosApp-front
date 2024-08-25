import 'package:exploregalapagos/Screens/Actividades/info_actividades.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/data_font.dart';

class ActividadCard extends StatelessWidget {
  final int idActividad;
  final String nombreActividad;
  final String horaInicio;
  final String horaFin;
  final String direccion;
  final String isla;
  final String precio;
  final String edad;
  final String imagen;

  const ActividadCard(
      {super.key,
      required this.idActividad,
      required this.nombreActividad,
      required this.horaInicio,
      required this.horaFin,
      required this.direccion,
      required this.isla,
      required this.precio,
      required this.edad,
      required this.imagen});

  @override
  Widget build(BuildContext context) {
    String horario = "$horaInicio - $horaFin";
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
                //width: 325,
                margin: const EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataFont(
                        dataTitulo: "Nombre: ", dataContenido: nombreActividad),
                    const SizedBox(height: 9),
                    DataFont(dataTitulo: "Horario: ", dataContenido: horario),
                    const SizedBox(height: 9),
                    DataFont(
                        dataTitulo: "Direccion: ", dataContenido: direccion),
                        const SizedBox(height: 9),
                    DataFont(
                        dataTitulo: "Isla: ", dataContenido: isla),
                        const SizedBox(height: 9),
                   
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SizedBox(height: 1)],
                    )
                  ],
                )),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              TextButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => InfoActividades(
                              idActividad: idActividad,
                              nombreActividad: nombreActividad,
                              horaInicio: horaInicio,
                              horaFin: horaFin,
                              direccion: direccion,
                              precio: precio,
                              edad: edad,
                              isla: isla,
                              imagen: imagen,)));
                },
                style: TextButton.styleFrom(
                  foregroundColor: colorbuttonGreen,
                ),
                child: const Text('Más información'),
              )
            ])
          ],
        ));
  }
}
