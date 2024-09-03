import 'package:dio/dio.dart';
import 'package:exploregalapagos/models/actividad.dart';
import 'package:exploregalapagos/models/isla.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/item_selection.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

import '../../widgets/actividad_card.dart';

class ActividadesDisponiblesScreen extends StatefulWidget {
  const ActividadesDisponiblesScreen(
      {super.key,
      required int idActividad,
      required String nombreActividad,
      required String direccion,
      required String isla});

  @override
  State<ActividadesDisponiblesScreen> createState() =>
      _ActividadesDisponiblesScreenState();
}

class _ActividadesDisponiblesScreenState extends State<ActividadesDisponiblesScreen> {

  /*{
      'id': 1,
      'nombreActividad': 'Latin Trails',
      'edad': '20',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 1',
      'precio': '\$10',
      'isla': 'Isabella',
      'imagen': 'https://latintrails.com/wp-content/uploads/2018/08/galapagos-adventure-latin-trails1.jpg'
    }*/

  List<Actividad>? actividades;
  List<Isla>? islas;

  List<String> nombreIslas = ['TODO'];

  String filtroIsla = 'TODO';

  List<Actividad>? ActividadesFiltradas = [];

  @override
  void initState() {
    super.initState();
    getIslas();
    getActividades();
  }


  Future<void> getIslas() async {
    try {
      var response = await Dio().get('$urlBack/isla/registradas/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        islas = data.map((json) => Isla.fromJson(json)).toList();
        setState(() {});
        nombresIsla();
      }
    } catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  void nombresIsla() {
    if (islas != null) {
      nombreIslas.addAll(islas!.map((isla) => isla.nombre).toList());
      setState(() {});
    }
  }

  Future<void> getActividades() async {
    try {
      var response = await Dio().get('$urlBack/actividad/');
      print("antes del if");
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        print("obteniendo respuesta");

        actividades = data.map((json) => Actividad.fromJson(json)).toList();
        print("conversion de datos a actividades");

        ActividadesFiltradas = actividades;
        setState(() {});
        print("Actividades: $actividades");
      }
    } catch (e) {
        print(e.toString());
    }
  }

  void actualizarFiltro(String nuevaIsla) {
    setState(() {
      filtroIsla = nuevaIsla;
      if (filtroIsla == 'TODO') {
        ActividadesFiltradas = actividades;
      } else {
        ActividadesFiltradas = actividades!
        .where((actividad) => actividad.isla.nombre.contains(filtroIsla))
        .toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
            appBar: const CustomAppBar(
              title: "Actividades Disponibles",
              back: true,
            ),
            backgroundColor: Colors.white,
            body: Column(
              children: [
                const SizedBox(height: 15),
                Card.outlined(
                    margin: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                    color: Colors.white,
                    elevation: 2,
                    child: ItemSelection(
                      title: "Seleccionar Isla",
                      items: nombreIslas,
                      onSelected: (nuevaIsla) =>
                        actualizarFiltro(nuevaIsla)
                  ),
              ),
                const SizedBox(height: 30),
                Expanded(
                    child: ListView.builder(
                        itemCount: ActividadesFiltradas!.length,
                        itemBuilder: (context, index) => ActividadCard(
                          idActividad: ActividadesFiltradas![index].id,
                          nombreActividad: ActividadesFiltradas![index].nombre,
                          horaInicio: ActividadesFiltradas![index].horaInicio.toString(),
                          horaFin: ActividadesFiltradas![index].horaFin.toString(),
                          direccion: ActividadesFiltradas![index].direccion,
                          isla: ActividadesFiltradas![index].isla.nombre,
                          precio: ActividadesFiltradas![index].precio.toString(),
                          edad: ActividadesFiltradas![index].edad.toString(),
                          imagen: ActividadesFiltradas![index].imagen,
                            )))
              ],
            )));
  }
}
