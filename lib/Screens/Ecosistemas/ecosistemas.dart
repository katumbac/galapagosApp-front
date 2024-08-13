import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class EcosistemasSensiblesScreen extends StatefulWidget {
  const EcosistemasSensiblesScreen({super.key});

  @override
  State<EcosistemasSensiblesScreen> createState() => _EcosistemasSensiblesScreenState();
}

class _EcosistemasSensiblesScreenState extends State<EcosistemasSensiblesScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Ecosistemas Sensibles",
            back: true,
          ),
        ));
  }
}
