import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/widgets/resenas_info_cards.dart';
import 'package:exploregalapagos/Screens/Negocios/Resenas/registrar_resena.dart';

class ResenasScreen extends StatefulWidget {
  final int idNegocio;
  final String nombreNegocio;
  final String linkImagen;
  const ResenasScreen({super.key, required this.idNegocio, required this.nombreNegocio, required this.linkImagen});

  @override
  State<ResenasScreen> createState() =>_ResenasScreenState();
}

class _ResenasScreenState extends State<ResenasScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: widget.nombreNegocio,
        back: true,
      ),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(height: 30),
          Center(
            child: Container(
              width: 300,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                  image: NetworkImage(widget.linkImagen),
                  // image: AssetImage('assets/imagen_local.jpg'), // Ruta de la imagen local
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          const ResenasInfoCards(),
          const SizedBox(height: 7),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(Icons.maps_ugc_outlined),
                color: const Color.fromARGB(255, 59, 66, 60),
                iconSize: 55.0,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                    builder: (context) =>  RegistrarResena(idNegocio: widget.idNegocio)));
                },
              ),
              const SizedBox(width: 25)
            ],
          ),
          const SizedBox(height: 10),
        ],
      )
    );
  }
}
