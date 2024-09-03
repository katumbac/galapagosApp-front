import 'package:dio/dio.dart';
import 'package:exploregalapagos/models/guia_turistico.dart';
import 'package:exploregalapagos/models/isla.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/guia_card.dart';
import 'package:exploregalapagos/widgets/item_selection.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';


class GuiasTuristicosScreen extends StatefulWidget {
  const GuiasTuristicosScreen({super.key});

  @override
  State<GuiasTuristicosScreen> createState() => _GuiasTuristicosScreenState();
}

class _GuiasTuristicosScreenState extends State<GuiasTuristicosScreen> {

  /* 
  {
      'id': 1,
      'nombre': 'Juan Piguave',
      'edad': 25,
      'telefono': '4895161516',
      'linkImagen':
          'https://static.vecteezy.com/system/resources/previews/014/288/076/non_2x/tourist-city-guide-with-flag-icon-cartoon-style-vector.jpg',
      'isla': 'Isabela',
    }
    */
  List<GuiaTuristico>? Guias;
  List<Isla>? islas;

  List<String> nombreIslas = ['TODO'];

  String filtroIsla = 'TODO';

  List<GuiaTuristico>? GuiasFiltrados = [];

  @override
  void initState() {
    super.initState();
    getIslas();
    getGuiaTuristico();
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

  Future<void> getGuiaTuristico() async {
    try {
      var response = await Dio().get('$urlBack/guias_turisticos/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        Guias = data.map((json) => GuiaTuristico.fromJson(json)).toList();
        GuiasFiltrados = Guias;
        setState(() {});
      }
    } catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  void actualizarFiltro(String nuevaIsla) {
    setState(() {
      filtroIsla = nuevaIsla;
      if (filtroIsla == 'TODO') {
        GuiasFiltrados = Guias;
      } else {
        GuiasFiltrados = Guias!
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
            title: "Guías Turísticos",
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
                    itemCount: GuiasFiltrados!.length,
                    itemBuilder: (context, index) => GuiaCard(
                          idGuia: GuiasFiltrados![index].id,
                          nombre: GuiasFiltrados![index].nombre,
                          edad: GuiasFiltrados![index].edad,
                          telefono: GuiasFiltrados![index].telefono,
                          linkImagen: GuiasFiltrados![index].imagen,
                          isla: GuiasFiltrados![index].isla.nombre,
                        )))
          ],
        )));
  }
}
