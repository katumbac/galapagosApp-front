import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/data_font.dart';

class ActividadInfoCard extends StatelessWidget {
  final int idActividad;
  final String nombreActividad;
  final String horaInicio;
  final String horaFin;
  final String direccion;
  final String isla;
  final String precio;
  final String edad;

  const ActividadInfoCard(
      {super.key,
      required this.idActividad,
      required this.nombreActividad,
      required this.horaInicio,
      required this.horaFin,
      required this.direccion,
      required this.isla,
      required this.precio,
      required this.edad});

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
            Container(
                //width: 325,
                margin: const EdgeInsets.fromLTRB(30.0, 0.0, 20.0, 0.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DataFont(
                        dataTitulo: "Nombre: ", dataContenido: nombreActividad),
                    const SizedBox(height: 9),
                    DataFont(
                        dataTitulo: "Edad: ", dataContenido: edad.toString()),
                    const SizedBox(height: 9),
                    DataFont(dataTitulo: "Precio: ", dataContenido: precio),
                    const SizedBox(height: 9),
                    DataFont(dataTitulo: "Horario: ", dataContenido: horario),
                    const SizedBox(height: 9),
                    DataFont(
                        dataTitulo: "Direccion: ", dataContenido: direccion),
                    const SizedBox(height: 9),
                    DataFont(dataTitulo: "Isla: ", dataContenido: isla),
                    const SizedBox(height: 9),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [SizedBox(height: 1)],
                    )
                  ],
                )),
          ],
        ));
  }
}
