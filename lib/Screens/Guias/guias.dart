import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class GuiasTuristicosScreen extends StatefulWidget {
  const GuiasTuristicosScreen({super.key});

  @override
  State<GuiasTuristicosScreen> createState() => _GuiasTuristicosScreenState();
}

class _GuiasTuristicosScreenState extends State<GuiasTuristicosScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Guias Turisticos",
            back: true,
          ),
        ));
  }
}
