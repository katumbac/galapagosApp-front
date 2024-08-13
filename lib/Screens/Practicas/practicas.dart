import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class PracticasResponsablesScreen extends StatefulWidget {
  const PracticasResponsablesScreen({super.key});

  @override
  State<PracticasResponsablesScreen> createState() => _PracticasResponsablesScreenState();
}

class _PracticasResponsablesScreenState extends State<PracticasResponsablesScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Prácticas Responsables",
            back: true,
          ),
        ));
  }
}
