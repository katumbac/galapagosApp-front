import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/Screens/Islas/info_isla.dart';
import 'package:exploregalapagos/models/isla.dart';

class CardInfoIsla extends StatefulWidget {
  const CardInfoIsla({
    super.key,
  });

  @override
  State<CardInfoIsla> createState() => _CardInfoIslaState();
}

class _CardInfoIslaState extends State<CardInfoIsla> {
  List<Isla>? islas;

  @override
  void initState() {
    super.initState();
    getIslas();
  }

  Future<void> getIslas() async {
    try {
      var response = await Dio().get('$urlBack/isla/registradas/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        islas = data.map((json) => Isla.fromJson(json)).toList();
        setState(() {});
      }
    } catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    if (islas == null || islas!.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: islas!.length,
            itemBuilder: (context, index) {
              Isla isla = islas![index];

              final maxCalificacion = [
                isla.calificacionUno,
                isla.calificacionDos,
                isla.calificacionTres,
              ].reduce((a, b) => a > b ? a : b);

              print('cali: $maxCalificacion');

              final displayStars = [
                if (isla.calificacionUno == maxCalificacion) 1,
                if (isla.calificacionDos == maxCalificacion) 2,
                if (isla.calificacionTres == maxCalificacion) 3
              ];

              print('displayStars: $displayStars');
              return CardIsla(
                  size: size, isla: isla, displayStars: displayStars);
            },
          ),
        )
      ],
    );
  }
}

class CardIsla extends StatelessWidget {
  const CardIsla({
    super.key,
    required this.size,
    required this.isla,
    required this.displayStars,
  });

  final Size size;
  final Isla isla;
  final List<int> displayStars;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: size.width * 0.5,
        height: size.height * 0.12,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 3,
          child: ListTile(
            contentPadding: const EdgeInsets.all(8.0),
            leading: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                isla.imagen,
                width: size.width * 0.25,
                height: size.height * 0.15,
                fit: BoxFit.cover,
              ),
            ),
            title: Text(
              isla.nombre,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: size.width * 0.05,
                color: colorbuttonGreen,
              ),
            ),
            subtitle: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: List.generate(
                      3,
                      (starIndex) => Icon(
                        Icons.star,
                        color:
                            starIndex < displayStars[0] ? gyellow : Colors.grey,
                        size: size.width * 0.05,
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                const Expanded(
                  child: Text(
                    'ver más...',
                    style: TextStyle(color: colorbuttonGreen),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => InfoIsla(
                    idIsla: isla.id,
                    nombre: isla.nombre,
                    calificacionUno: isla.calificacionUno,
                    calificacionDos: isla.calificacionDos,
                    calificacionTres: isla.calificacionTres,
                    descripcion: isla.descripcion,
                    imagen: isla.imagen,
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
