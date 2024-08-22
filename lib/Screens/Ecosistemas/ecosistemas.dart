import 'package:exploregalapagos/Screens/Ecosistemas/info_ecosistema.dart';
import 'package:exploregalapagos/widgets/card_info_eco.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class EcosistemasSensiblesScreen extends StatefulWidget {
  const EcosistemasSensiblesScreen({super.key});

  @override
  State<EcosistemasSensiblesScreen> createState() =>
      _EcosistemasSensiblesScreenState();
}

class _EcosistemasSensiblesScreenState
    extends State<EcosistemasSensiblesScreen> {
  final List<Map<String, dynamic>> ecosistemas = [
    {
      'idEco': '1',
      'nombre':
          'Los manglares son oasis de vida en las costas volcánicas de las Islas Galápagos',
      'descripcion':
          'Las islas Galápagos son las únicas islas volcánicas en el Pacífico Este en donde los manglares se encuentran de manera natural. Los científicos de la FCD utilizaron imágenes de satélite para cartografiar la distribución de estos manglares en todo el archipiélago, y estimaron que están presentes en aproximadamente un tercio de todas las zonas costeras. A pesar de la importancia de estos ecosistemas, hasta la fecha existía poca información sobre las especies de peces que los utilizan a lo largo del archipiélago y su importancia como zonas de crianza para especies de interés socioeconómico. Los trabajos anteriores sobre los manglares de las Galápagos se han centrado en gran medida en las islas habitadas del archipiélago o en un subconjunto de especies. El presente estudio se basa en estos trabajos anteriores para ampliar nuestra comprensión de la importancia de estos hábitats y contribuir al desarrollo de estrategias y políticas que puedan proteger estas zonas de forma más eficaz.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2023/04/los-tuneles-isabela278091723.jpeg?w=800&ssl=1',
    },
    {
      'idEco': '2',
      'nombre': 'Juveniles de peces entre las raíces de los manglares',
      'descripcion': 'Descripción de Isla Isabela.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2023/04/los-tuneles-isabela278091723.jpeg?w=800&ssl=1',
    },
    {
      'idEco': '3',
      'nombre': 'Rayas doradas en manglar',
      'descripcion': 'Descripción de Isla Isabela.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2023/04/los-tuneles-isabela278091723.jpeg?w=800&ssl=1',
    },
    {
      'idEco': '4',
      'nombre':
          'Evaluación de la abundancia y la diversidad de la comunidad de peces',
      'descripcion': 'Descripción de Isla Isabela.',
      'imagen':
          'https://i0.wp.com/ecuadorgalapagosinfo.com/wp-content/uploads/2023/04/los-tuneles-isabela278091723.jpeg?w=800&ssl=1',
    },
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const CustomAppBar(
          title: "Ecosistemas Sensibles",
          back: true,
        ),
        body: Center(
            child: ListView.builder(
                itemCount: ecosistemas.length,
                itemBuilder: (context, index) {
                  final eco = ecosistemas[index];
                  print('id eco: $eco');
                  return CardInfoEco(
                    size: size,
                    eco: eco,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => InfoEcosistema(
                            idEco: eco['idEco']!,
                            nombre: eco['nombre']!,
                            descripcion: eco['descripcion']!,
                            imagen: eco['imagen']!,
                          ),
                        ),
                      );
                    },
                  );
                })));
  }
}
