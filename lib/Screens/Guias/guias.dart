import 'package:exploregalapagos/widgets/guia_card.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

import '../../widgets/item_selection.dart';

class GuiasTuristicosScreen extends StatefulWidget {
  const GuiasTuristicosScreen({super.key});

  @override
  State<GuiasTuristicosScreen> createState() => _GuiasTuristicosScreenState();
}

class _GuiasTuristicosScreenState extends State<GuiasTuristicosScreen> {

  List<Map> guias = [
    {
      'id': 1,
      'nombre': 'Juan Piguave',
      'edad': 25,
      'telefono': '4895161516',
      'linkImagen':
          'https://static.vecteezy.com/system/resources/previews/014/288/076/non_2x/tourist-city-guide-with-flag-icon-cartoon-style-vector.jpg',
      'isla': 'Isabela',
    },
    {
      'id': 2,
      'nombre': 'Pedro Piguave',
      'edad': 25,
      'telefono': '1589624786',
      'linkImagen':
          'https://static.vecteezy.com/system/resources/previews/014/288/076/non_2x/tourist-city-guide-with-flag-icon-cartoon-style-vector.jpg',
      'isla': 'Isabela',
    },
    {
      'id': 3,
      'nombre': 'Maria Piguave',
      'edad': 25,
      'telefono': '1235894786',
      'linkImagen':
          'https://i.pinimg.com/736x/f7/04/23/f7042358106789c07fdd2b89bafcd558.jpg',
      'isla': 'Santa Cruz',
    },
    {
      'id': 4,
      'nombre': 'Jose Piguave',
      'edad': 25,
      'telefono': '1235847965',
      'linkImagen':
          'https://static.vecteezy.com/system/resources/previews/014/288/076/non_2x/tourist-city-guide-with-flag-icon-cartoon-style-vector.jpg',
      'isla': 'Isabela',
    },
    {
      'id': 5,
      'nombre': 'Juana Piguave',
      'edad': 25,
      'telefono': '1230564789',
      'linkImagen':
          'https://i.pinimg.com/736x/f7/04/23/f7042358106789c07fdd2b89bafcd558.jpg',
      'isla': 'Isabela',
    }
    
  ];

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
            const Card.outlined(
              margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              color: Colors.white,
              elevation: 2,
              child: ItemSelection(
                title: "Seleccionar Isla",
                items: ['TODO', 'ISABELA', 'SANTA CRUZ'],
              ),
            ),
            const SizedBox(height: 30),
            Expanded(
                child: ListView.builder(
                    itemCount: guias.length,
                    itemBuilder: (context, index) => GuiaCard(
                          idGuia: guias[index]['id'],
                          nombre: guias[index]['nombre']!,
                          edad: guias[index]['edad'],
                          telefono: guias[index]['telefono']!,
                          linkImagen: guias[index]['linkImagen']!,
                          isla: guias[index]['isla']!,
                        )))
          ],
        )));
  }
}
