import 'package:exploregalapagos/Screens/Actividades/actividades.dart';
import 'package:exploregalapagos/Screens/Ecosistemas/ecosistemas.dart';
import 'package:exploregalapagos/Screens/Guias/guias.dart';
import 'package:exploregalapagos/Screens/Negocios/negocios.dart';
import 'package:exploregalapagos/Screens/Islas/islas.dart';
import 'package:exploregalapagos/Screens/Biodiversidad/biodiversidad.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/grid_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var idActividad = 0;
    var nombreActividad = '';
    var direccion = '';
    var isla = '';

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: const CustomAppBar(title: "EXPLOREGALÁPAGOS."),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: size.height * 0.01),
             Align(
              alignment: Alignment.center,
              child: Text('Bienvenido/a ${Credenciales.nicknameUsuario}',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: colorbuttonGreen,
                ),
              ),
            ),
            SizedBox(height: size.height * 0.03),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                children: [
                  GridItem(
                    icon: Icons.compost_outlined,
                    title: 'Biodiversidad',
                    index: 0,
                    nextPage: const BiodiversidadScreen(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                  GridItem(
                    icon: Icons.location_on_outlined,
                    title: 'Las Islas Principales',
                    index: 2,
                    nextPage: const IslasScreen(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                  GridItem(
                    icon: Icons.grass_outlined,
                    title: 'Ecosistemas Sensibles',
                    index: 1,
                    nextPage: const EcosistemasSensiblesScreen(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                  GridItem(
                    icon: Icons.store_outlined,
                    title: 'Negocios',
                    index: 3,
                    nextPage: const NegociosScreen(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                  GridItem(
                    icon: Icons.groups_3_outlined,
                    title: 'Guías Turisticos',
                    index: 4,
                    nextPage: const GuiasTuristicosScreen(),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                  GridItem(
                    icon: Icons.directions_run_outlined,
                    title: 'Actividades Disponibles',
                    index: 5,
                    nextPage: ActividadesDisponiblesScreen(
                      idActividad: idActividad,
                      nombreActividad: nombreActividad,
                      direccion: direccion,
                      isla: isla,
                    ),
                    selectedIndex: _selectedIndex,
                    onSelect: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    selectedGradient: selectedGradient,
                    defaultGradient: defaultGradient,
                    selectIconTextColor: selectIconTextColor,
                    defaultIconColor: defaultIconColor,
                    defaultIconTextColor: defaultIconTextColor,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
