import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/card_info_isla.dart';
import 'package:exploregalapagos/Screens/Islas/info_isla.dart';

class IslasScreen extends StatefulWidget {
  const IslasScreen({super.key});

  @override
  State<IslasScreen> createState() => _IslasScreenState();
}

class _IslasScreenState extends State<IslasScreen> {
  final List<Map<String, dynamic>> islas = [
    {
      'idIsla': '1',
      'nombre': 'Isla Isabela',
      'calificacionUno': 1,
      'calificacionDos': 1,
      'calificacionTres': 50,
      'descripcion':
          'Albemarle en inglés;Isla más grande 4588 km2; 2.344 habitantes (2015);Punto más alto: volcán Wolf 1.707 m ;Animales: Tortugas gigantes, pingüinos, cormoranes, iguanas marinas, iguanas terrestres, lobos marinos, pelícanos, cangrejos rojos, pinzones, flamencos, halcones y palomas.;Puntos de interés: muro de las lágrimas, laguna flamingo, Tagus Cove, Bahía Urbina, Punta Vicente Roca, Bahía Elizabeth, Las Tintoreras; Activitades: caminatas, paseos en bote, observación de aves, observación de tortugas, buceo/snorkel;Ciudad principal: Puerto Villamil.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2023/04/los-tuneles-isabela278091723.jpeg?w=800&ssl=1',
    },
    {
      'idIsla': '2',
      'nombre': 'Isla Santa Cruz',
      'calificacionUno': 1,
      'calificacionDos': 3,
      'calificacionTres': 6,
      'descripcion': 'Descripción de Isla Santa Cruz.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2019/02/tortugas-estacion-charles-darwin.jpg?w=800&ssl=1',
    },
    {
      'idIsla': '3',
      'nombre': 'Isla Fernandina',
      'calificacionUno': 100,
      'calificacionDos': 6,
      'calificacionTres': 1,
      'descripcion': 'Descripción de Isla Fernandina.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2019/03/lobos-marinos-iguanas.jpg?w=800&ssl=1',
    },
    {
      'idIsla': '4',
      'nombre': 'Isla Santiago',
      'calificacionUno': 1,
      'calificacionDos': 2,
      'calificacionTres': 1,
      'descripcion': 'Descripción de Isla Santiago.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2023/05/puerto-egas.jpeg?w=800&ssl=1',
    },
    {
      'idIsla': '5',
      'nombre': 'Isla San Cristóbal',
      'calificacionUno': 2,
      'calificacionDos': 1,
      'calificacionTres': 5,
      'descripcion': 'Descripción de Isla San Cristóbal.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2020/01/faro-punta-carola.jpg?w=800&ssl=1',
    },
    {
      'idIsla': '6',
      'nombre': 'Isla Floreana',
      'calificacionUno': 1,
      'calificacionDos': 5,
      'calificacionTres': 1,
      'descripcion': 'Descripción de Isla Floreana.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2020/01/faro-punta-carola.jpg?w=800&ssl=1',
    },
    {
      'idIsla': '7',
      'nombre': 'Isla Santa Fé',
      'calificacionUno': 1,
      'calificacionDos': 5,
      'calificacionTres': 1,
      'descripcion': 'Descripción de Isla Santa Fé.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2019/07/iguana-marina-santa-fe.jpg?w=800&ssl=1',
    },
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Las Islas Principales",
          back: true,
        ),
        body: Center(
            child: ListView.builder(
          itemCount: islas.length,
          itemBuilder: (context, index) {
            final isla = islas[index];

            final maxCalificacion = [
              isla['calificacionUno'],
              isla['calificacionDos'],
              isla['calificacionTres'],
            ].reduce((a, b) => a > b ? a : b);

            print('cali: $maxCalificacion');

            final displayStars = [
              if (isla['calificacionUno'] == maxCalificacion) 1,
              if (isla['calificacionDos'] == maxCalificacion) 2,
              if (isla['calificacionTres'] == maxCalificacion) 3
            ];

            print('displayStars: $displayStars');
            return CardInfoIsla(
              size: size,
              isla: isla,
              displayStars: displayStars[0],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => InfoIsla(
                      idIsla: isla['idIsla']!,
                      nombre: isla['nombre']!,
                      calificacionUno: isla['calificacionUno']!,
                      calificacionDos: isla['calificacionDos']!,
                      calificacionTres: isla['calificacionTres']!,
                      descripcion: isla['descripcion']!,
                      imagen: isla['imagen']!,
                    ),
                  ),
                );
              },
            );
          },
        )));
  }
}
