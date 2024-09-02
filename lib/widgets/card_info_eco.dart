import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/models/ecosistemas.dart';
import 'package:exploregalapagos/Screens/Ecosistemas/info_ecosistema.dart';

class CardInfoEco extends StatefulWidget {
  const CardInfoEco({
    super.key,
  });

  @override
  State<CardInfoEco> createState() => _CardInfoEcoState();
}

class _CardInfoEcoState extends State<CardInfoEco> {
  List<Ecosistema>? ecosistemas;

  @override
  void initState() {
    super.initState();
    getIslas();
  }

  Future<void> getIslas() async {
    try {
      var response = await Dio().get('$urlBack/ecosistema/registrados/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        ecosistemas = data.map((json) => Ecosistema.fromJson(json)).toList();
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

    if (ecosistemas == null || ecosistemas!.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: ecosistemas!.length,
              itemBuilder: (context, index) {
                final eco = ecosistemas![index];
                print('id eco: $eco');
                return CardEco(size: size, eco: eco);
              }),
        ),
      ],
    );
  }
}

class CardEco extends StatelessWidget {
  const CardEco({
    super.key,
    required this.size,
    required this.eco,
  });

  final Size size;
  final Ecosistema eco;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: SizedBox(
        width: size.width * 0.5,
        height: size.height * 0.12,
        child: GestureDetector(
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
            elevation: 3,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.network(
                      eco.imagen,
                      width: size.width * 0.25,
                      height: size.height * 0.15,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Expanded(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          child: Text(
                            eco.nombre,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: size.width * 0.05,
                              color: colorbuttonGreen,
                            ),
                            overflow: TextOverflow.visible,
                            maxLines: 3,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 8.0),
                  Icon(
                    Icons.chevron_right_outlined,
                    color: colorbuttonGreen,
                    size: size.width * 0.05,
                  ),
                  const SizedBox(width: 8.0),
                ],
              ),
            ),
          ),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InfoEcosistema(
                  idEco: eco.id,
                  nombre: eco.nombre,
                  descripcion: eco.descripcion,
                  imagen: eco.imagen,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
