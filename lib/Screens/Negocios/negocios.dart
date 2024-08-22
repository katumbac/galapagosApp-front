import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/item_selection.dart';
import 'package:exploregalapagos/widgets/negocio_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/text.dart';

class NegociosScreen extends StatefulWidget {
  const NegociosScreen({super.key});

  @override
  State<NegociosScreen> createState() => _NegociosScreenState();
}

class _NegociosScreenState extends State<NegociosScreen> {
  List<Map> negocios = [
    {'id': 1, 'nombreNegocio': 'negocio 1', 'servicios': 'comidas ricas', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'direccion 1', 'linkImagen': 'linkImagen'},
    {'id': 2, 'nombreNegocio': 'negocio 2', 'servicios': 'cocteles', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'id': 3, 'nombreNegocio': 'negocio 3', 'servicios': 'cocteles', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'id': 4, 'nombreNegocio': 'negocio 4', 'servicios': 'cocteles', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'id': 5, 'nombreNegocio': 'negocio 5', 'servicios': 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'direccion 2', 'linkImagen': 'linkImagen'},
  ];

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: const CustomAppBar(
            title: "Negocios",
            back: true,
          ),
          body: Column(
            children: [
              SizedBox(height: 15),
              const Card.outlined(
                margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                child: ItemSelection(
                      title: "Seleccionar Isla",
                      items: ['TODO', 'ISABELA', 'SANTA CRUZ'],
                  ),
              ),
              SizedBox(height: 15),
              const Card.outlined(
                margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                child: ItemSelection(
                      title: "Seleccionar Tipo de Negocio",
                      items: ['TODO', 'HOTEL', 'RESTAURANTE', 'TIENDA'],
                  ),
              ),
              SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: negocios.length,
                  itemBuilder: (context, index) => NegocioCard(
                    idNegocio: negocios[index]['id'],
                    nombreNegocio: negocios[index]['nombreNegocio']!,
                    servicios: negocios[index]['servicios']!,
                    horaInicio: negocios[index]['horaInicio']!,
                    horaFin: negocios[index]['horaFin']!,
                    direccion: negocios[index]['direccion']!,
                    linkImagen: negocios[index]['linkImagen']!,
                  )
                )
              )   
              ],
          )
        );
  }
}