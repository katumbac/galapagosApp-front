import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class ActividadesDisponiblesScreen extends StatefulWidget {
  const ActividadesDisponiblesScreen({super.key});

  @override
  State<ActividadesDisponiblesScreen> createState() =>
      _ActividadesDisponiblesScreenState();
}

class _ActividadesDisponiblesScreenState
    extends State<ActividadesDisponiblesScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Actividades Disponibles",
            back: true,
          ),
        ));
  }
}
