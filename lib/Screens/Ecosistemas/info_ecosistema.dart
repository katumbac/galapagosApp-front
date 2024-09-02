import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';

class InfoEcosistema extends StatelessWidget {
  final int idEco;
  final String nombre;
  final String descripcion;
  final String imagen;

  const InfoEcosistema({
    super.key,
    required this.idEco,
    required this.nombre,
    required this.descripcion,
    required this.imagen,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          nombre,
          style: const TextStyle(fontSize: 20, color: Colors.white),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            color: colorbuttonGreen,
          ),
        ),
      ),
      body: Container(
        width: size.width,
        height: size.height,
        padding: const EdgeInsets.all(20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 5),
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    imagen,
                    width: double.infinity,
                    height: size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 12.0),
                Center(
                  child: Text(
                    nombre,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: size.width * 0.04,
                      color: colorbuttonGreen,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                const SizedBox(height: 20.0),
                Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                      descripcion,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: size.width * 0.03,
                      ),
                      overflow: TextOverflow.visible,
                      maxLines: null,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
