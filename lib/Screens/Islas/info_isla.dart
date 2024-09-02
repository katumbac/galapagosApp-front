import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:dio/dio.dart';

class InfoIsla extends StatefulWidget {
  final int idIsla;
  final String nombre;
  final int calificacionUno;
  final int calificacionDos;
  final int calificacionTres;
  final String descripcion;
  final String imagen;

  InfoIsla({
    super.key,
    required this.idIsla,
    required this.nombre,
    required this.calificacionUno,
    required this.calificacionDos,
    required this.calificacionTres,
    required this.descripcion,
    required this.imagen,
  });

  final List<IconData> _iconos = [
    Icons.language,
    Icons.landscape,
    Icons.group,
    Icons.location_on,
    Icons.pets,
    Icons.star,
  ];

  @override
  _InfoIslaState createState() => _InfoIslaState();
}

class _InfoIslaState extends State<InfoIsla> {
  int estrellas = 0;
  int idusuario = Credenciales.idUsuario;

  @override
  void initState() {
    super.initState();
    getCalificacionUsuario();
  }

  Future<void> getCalificacionUsuario() async {
    try {
      var response = await Dio().get(
          '$urlBack/calificacion/usuario/$idusuario/isla/${widget.idIsla}/');
      print(idusuario);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;

        if (data.isNotEmpty) {
          final calificacion = data[0];
          print(calificacion);
          
          final puntuacion = calificacion['puntuacion'];

          setState(() {
            estrellas = puntuacion;
          });
        }
      } else {
        print('Error al obtener calificación: ${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        print('Error peticion ${e.response?.data}');
      }
    }
  }

  Future<void> registrarCalificacion(int puntuacion) async {
    try {
      final response = await Dio().post(
        '$urlBack/calificacion/registrar_calificacion/',
        data: {
          'voto': true,
          'puntuacion': puntuacion,
          'isla': widget.idIsla,
          'usuario': idusuario,
        },
      );

      if (response.statusCode == 201) {
        print('Calificación registrada correctamente');
      } else {
        print('Error al registrar calificación: ${response.statusCode}');
      }
    } catch (e) {
      print('Error en la petición: $e');
    }
  }

  Future<void> _handleCalificacion(int puntuacion) async {
    setState(() {
      estrellas = puntuacion;
    });
    await registrarCalificacion(puntuacion);
  }
  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final descripcionPartes = widget.descripcion.split(';');
    return Scaffold(
        appBar: AppBar(
          title: Text(
            widget.nombre,
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
        body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              elevation: 3,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(
                    20.0, 10.0, 20.0, 20.0), //iz,s,d,i,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Center(
                      child: Text(
                        'Calificación',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.01,
                    ),
                    CalificacionPorIsla(
                        calificacionUno: widget.calificacionUno,
                        calificacionDos: widget.calificacionDos,
                        calificacionTres: widget.calificacionTres),
                    const SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        widget.imagen,
                        width: double.infinity, // Ancho máximo
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Expanded(
                      child: ListView.builder(
                        itemCount: descripcionPartes.length,
                        itemBuilder: (context, index) {
                          if (index >= widget._iconos.length) {
                            return const SizedBox.shrink();
                          }

                          final parte = descripcionPartes[index].trim();
                          final icono = widget._iconos[index];

                          return ListTile(
                            leading: Container(
                              decoration: BoxDecoration(
                                color: colorbuttonGreen,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              padding: const EdgeInsets.all(10.0),
                              child: Icon(
                                icono,
                                color: Colors.white,
                                size: 20.0,
                              ),
                            ),
                            title: Text(parte),
                          );
                        },
                      ),
                    ),
                    const SizedBox(height: 12.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          'Califica tu visita:',
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(width: 10),
                        Row(
                          children: List.generate(
                            3,
                            (index) => GestureDetector(
                              onTap: () {
                                estrellas = index + 1;
                                _handleCalificacion(estrellas);
                              },
                              child: Icon(
                                Icons.star,
                                color:
                                    index < estrellas ? gyellow : Colors.grey,
                                size: 40.0,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )));
  }
}

class CalificacionPorIsla extends StatelessWidget {
  const CalificacionPorIsla({
    super.key,
    required this.calificacionUno,
    required this.calificacionDos,
    required this.calificacionTres,
  });

  final int calificacionUno;
  final int calificacionDos;
  final int calificacionTres;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _buildRatingRow(1, calificacionUno),
        _buildRatingRow(2, calificacionDos),
        _buildRatingRow(3, calificacionTres),
      ],
    );
  }

  Widget _buildRatingRow(int estrellas, int votos) {
    return Row(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(
            3,
            (index) => Icon(
              Icons.star,
              color: index < estrellas ? gyellow : Colors.grey,
            ),
          ),
        ),
        Text('$votos'),
      ],
    );
  }
}
