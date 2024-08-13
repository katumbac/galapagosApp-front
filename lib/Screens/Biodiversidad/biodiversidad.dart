import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';

class BiodiversidadScreen extends StatefulWidget {
  const BiodiversidadScreen({super.key});

  @override
  State<BiodiversidadScreen> createState() => _BiodiversidadScreenState();
}

class _BiodiversidadScreenState extends State<BiodiversidadScreen> {
  @override
  Widget build(BuildContext context) {
    return const DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: CustomAppBar(
            title: "Biodiversidad",
            back: true,
            bottom: TabBar(
              tabs: [
                Tab(text: "Fauna"),
                Tab(text: "Flora"),
              ],
              labelColor: Color.fromARGB(255, 240, 204, 0),
              unselectedLabelColor: Color.fromARGB(255, 255, 255, 255),
              indicatorColor: Color.fromARGB(255, 240, 204, 0),
              indicatorWeight: 3.0,
            ),
          ),
        ));
  }
}
