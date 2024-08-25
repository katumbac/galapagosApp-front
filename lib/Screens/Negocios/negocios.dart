import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/item_selection.dart';
import 'package:exploregalapagos/widgets/negocio_card.dart';

class NegociosScreen extends StatefulWidget {
  const NegociosScreen({super.key});

  @override
  State<NegociosScreen> createState() => _NegociosScreenState();
}

class _NegociosScreenState extends State<NegociosScreen> {
  List<Map> negocios = [
    {
      'id': 1,
      'nombreNegocio': 'Negocio 1',
      'servicios': 'comidas ricas',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 1',
      'linkImagen':
          'https://www.lavanguardia.com/files/image_990_484/files/fp/uploads/2021/12/23/61c456cc62a0b.r_d.2520-1680.jpeg'
    },
    {
      'id': 2,
      'nombreNegocio': 'Negocio 2',
      'servicios': 'desayunos a buen precio',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 2',
      'linkImagen':
          'https://aureoarquitectura.com/wp-content/uploads/2023/09/Diseno-interior-restaurant.webp'
    },
    {
      'id': 3,
      'nombreNegocio': 'Negocio 3',
      'servicios': 'tiendita',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 3',
      'linkImagen':
          'https://cdn.forbes.com.mx/2022/06/super-tienda-e1654633021697-640x360.jpg'
    },
    {
      'id': 4,
      'nombreNegocio': 'Negocio 4',
      'servicios': 'hotel nocturno',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 5',
      'linkImagen':
          'https://cf.bstatic.com/xdata/images/hotel/max1024x768/262917546.jpg?k=3483ea13dd1d52efa6cbd3cb2444857bb35e3d4de05cff4f06086fe366a2186d&o=&hp=1'
    },
    {
      'id': 5,
      'nombreNegocio': 'Negocio 5',
      'servicios': 'comida comidita comidota',
      'horaInicio': '6:30',
      'horaFin': '21:00',
      'direccion': 'Direccion 5',
      'linkImagen':
          'https://www.abasturhub.com/img/blog/mejores-restaurantes---diseno-sin-titulo.webp'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Negocios",
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
            const SizedBox(height: 15),
            const Card.outlined(
              margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
              color: Colors.white,
              elevation: 2,
              child: ItemSelection(
                title: "Seleccionar Tipo de Negocio",
                items: ['TODO', 'HOTEL', 'RESTAURANTE', 'TIENDA'],
              ),
            ),
            const SizedBox(height: 30),
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
                        )))
          ],
        ));
  }
}
