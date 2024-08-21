import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/item_selection.dart';
import 'package:exploregalapagos/widgets/negocio_card.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/src/widgets/text.dart';

class NegociosScreen extends StatefulWidget {
  const NegociosScreen({super.key});

  @override
  State<NegociosScreen> createState() => _NegociosScreenState();
}

class _NegociosScreenState extends State<NegociosScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: CustomAppBar(
            title: "Negocios",
            back: true,
          ),
          body: Column(
            children: [
              SizedBox(height: 15),
              Card.outlined(
                margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                child: ItemSelection(
                      title: "Seleccionar Isla",
                      styles: ['TODO', 'ISABELA', 'SANTA CRUZ'],
                  ),
              ),
              SizedBox(height: 15),
              Card.outlined(
                margin: EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                child: ItemSelection(
                      title: "Seleccionar Tipo de Negocio",
                      styles: ['TODO', 'Hotel', 'Restaurante', 'Tienda'],
                  ),
              ),
              SizedBox(height: 30),
              NegocioCard(nombreNegocio: "Palm Beach", servicios: "Cocteles, comidas ricas", horaInicio: "6:30", horaFin: "21:00", direccion: "Av. Islas", linkImagen: "linkImagen")
            ],
          )
        );
  }
}