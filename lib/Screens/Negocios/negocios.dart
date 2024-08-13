import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class NegociosScreen extends StatefulWidget {
  const NegociosScreen({super.key});

  @override
  State<NegociosScreen> createState() => _NegociosScreenState();
}

class _NegociosScreenState extends State<NegociosScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Negocios",
            back: true,
          ),
        ));
  }
}
