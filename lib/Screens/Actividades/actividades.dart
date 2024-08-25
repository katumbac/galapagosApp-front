import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

import '../../widgets/actividad_card.dart';
import '../../widgets/item_selection.dart';

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

class _ActividadesDisponiblesScreenState
    extends State<ActividadesDisponiblesScreen> {
  List<Map> actividades = [
    {
      'id': 1,
      'nombreActividad': 'Latin Trails',
      'edad': '20',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 1',
      'precio': '\$10',
      'isla': 'Isabella',
      'imagen': 'https://latintrails.com/wp-content/uploads/2018/08/galapagos-adventure-latin-trails1.jpg'
    },
    {
      'id': 2,
      'nombreActividad': 'Snorkel',
      'edad': '20',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 2',
      'precio': '\$10',
      'isla': 'Isabella',
      'imagen': 'https://img.goraymi.com/2021/05/19/b325d7e1278c8833b49d6a1c086f1e18_xl.jpg'
    },
    {
      'id': 3,
      'nombreActividad': 'Senderismo',
      'edad': '20',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 3',
      'precio': '\$10',
      'isla': 'Isabella',
      'imagen': 'https://naturegalapagos.com/es/wp-content/uploads/sites/3/2018/12/que-hacer-en-isla-isabela-galapagos-feat.jpg'
    },
    {
      'id': 4,
      'nombreActividad': 'Buceo',
      'edad': '20',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 5',
      'precio': '\$10',
      'isla': 'Isabella',
      'imagen': 'https://s3-us-west-1.amazonaws.com/tipsparatuviaje/wp-content/uploads/2017/04/1.-Bucea-y-surfea-en-Isla-Santa-Cruz.jpg'
    },
    {
      'id': 5,
      'nombreActividad': 'Ciclismo',
      'edad': '20',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 5',
      'precio': '\$10',
      'isla': 'Isabella',
      'imagen': 'https://livingecuadortravel.com/wp-content/uploads/2019/12/Bicicleta-en-Isabela-1024x683.jpg'
    },
  ];
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
                        itemCount: actividades.length,
                        itemBuilder: (context, index) => ActividadCard(
                              idActividad: actividades[index]['id'],
                              nombreActividad: actividades[index]
                                  ['nombreActividad']!,
                              horaInicio: actividades[index]['horaInicio']!,
                              horaFin: actividades[index]['horaFin']!,
                              direccion: actividades[index]['direccion']!,
                              isla: actividades[index]['isla']!,
                              precio: actividades[index]['precio']!,
                              edad: actividades[index]['edad']!,
                              imagen: actividades[index]['imagen']!,
                            )))
              ],
            )));
  }
}
