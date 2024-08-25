import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import '../../widgets/actividad_info_card.dart';

class InfoActividades extends StatefulWidget {
  final int idActividad;
  final String nombreActividad;
  final String horaInicio;
  final String horaFin;
  final String direccion;
  final String isla;
  final String precio;
  final String edad;
  final String imagen;

  const InfoActividades(
      {super.key,
      required this.idActividad,
      required this.nombreActividad,
      required this.horaInicio,
      required this.horaFin,
      required this.direccion,
      required this.precio,
      required this.edad,
      required this.isla,
      required this.imagen});

  @override
  State<InfoActividades> createState() => _ActividadesDisponiblesScreenState();
}

class _ActividadesDisponiblesScreenState extends State<InfoActividades> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          title: widget.nombreActividad,
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
                  image: NetworkImage(widget.imagen),
                  // image: AssetImage('assets/imagen_local.jpg'), // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
            const SizedBox(height: 30),
            ActividadInfoCard(
                idActividad: widget.idActividad,
                nombreActividad: widget.nombreActividad,
                horaInicio: widget.horaInicio,
                horaFin: widget.horaFin,
                direccion: widget.direccion,
                isla: widget.isla,
                precio: widget.precio,
                edad: widget.edad),
            const SizedBox(height: 7),
            const SizedBox(height: 10),
          ],
        ));
  }
}
