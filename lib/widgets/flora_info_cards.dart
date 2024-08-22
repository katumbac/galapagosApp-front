import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/flora_card.dart';

class FloraInfoCards extends StatefulWidget {
  const FloraInfoCards({super.key});

  @override
  State<FloraInfoCards> createState() => _FloraInfoCardsState();
}

class _FloraInfoCardsState extends State<FloraInfoCards> {
  List<Map<String,String>> flora = [
    {'nombreComun': 'negocio 1', 'nombreCientifico': 'comidas ricas', 'datoCurioso': '6:30', 'distribucion': '21:00', 'usos': 'direccion 1', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 2', 'nombreCientifico': 'cocteles', 'datoCurioso': '6:30', 'distribucion': '21:00', 'usos': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 3', 'nombreCientifico': 'cocteles', 'datoCurioso': '6:30', 'distribucion': '21:00', 'usos': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 4', 'nombreCientifico': 'cocteles', 'datoCurioso': '6:30', 'distribucion': '21:00', 'usos': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 5', 'nombreCientifico': 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'datoCurioso': '6:30', 'distribucion': '21:00', 'usos': 'direccion 2', 'linkImagen': 'linkImagen'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: flora.length,
        itemBuilder: (context, index) => FloraCard(
          nombreComun: flora[index]['nombreComun']!,
          nombreCientifico: flora[index]['nombreCientifico']!,
          datoCurioso: flora[index]['datoCurioso']!,
          distribucion: flora[index]['distribucion']!,
          usos: flora[index]['usos']!,
          linkImagen: flora[index]['linkImagen']!,
        )
      )
    );
  }
}