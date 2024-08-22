import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/fauna_card.dart';

class FaunaInfoCards extends StatefulWidget {
  const FaunaInfoCards({super.key});

  @override
  State<FaunaInfoCards> createState() => _FaunaInfoCardsState();
}

class _FaunaInfoCardsState extends State<FaunaInfoCards> {
  List<Map<String,String>> fauna = [
    {'nombreComun': 'negocio 1', 'nombreCientifico': 'comidas ricas', 'datoCurioso': '6:30', 'habitat': '21:00', 'alimentacion': 'direccion 1', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 2', 'nombreCientifico': 'cocteles', 'datoCurioso': '6:30', 'habitat': '21:00', 'alimentacion': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 3', 'nombreCientifico': 'cocteles', 'datoCurioso': '6:30', 'habitat': '21:00', 'alimentacion': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 4', 'nombreCientifico': 'cocteles', 'datoCurioso': '6:30', 'habitat': '21:00', 'alimentacion': 'direccion 2', 'linkImagen': 'linkImagen'},
    {'nombreComun': 'negocio 5', 'nombreCientifico': 'aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa', 'datoCurioso': '6:30', 'habitat': '21:00', 'alimentacion': 'direccion 2', 'linkImagen': 'linkImagen'},
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: fauna.length,
        itemBuilder: (context, index) => FaunaCard(
          nombreComun: fauna[index]['nombreComun']!,
          nombreCientifico: fauna[index]['nombreCientifico']!,
          datoCurioso: fauna[index]['datoCurioso']!,
          habitat: fauna[index]['habitat']!,
          alimentacion: fauna[index]['alimentacion']!,
          linkImagen: fauna[index]['linkImagen']!,
        )
      )
    );
  }
}