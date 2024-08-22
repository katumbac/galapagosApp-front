import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/fauna_card.dart';
import 'package:exploregalapagos/widgets/fauna_info_cards.dart';
import 'package:exploregalapagos/widgets/flora_card.dart';
import 'package:exploregalapagos/widgets/flora_info_cards.dart';
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
          backgroundColor: Colors.white,
          body: TabBarView(
            children: [
              Column(
                children:[
                  SizedBox(height: 20),
                  FaunaInfoCards()
                ]
              ),
              Column(
                children:[
                  SizedBox(height: 20),
                  FloraInfoCards()
                ]
              )
            ]
          ),
        ));
  }
}
