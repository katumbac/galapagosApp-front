import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/flora_card.dart';
import 'package:exploregalapagos/models/flora.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/shared/constants.dart';

class FloraInfoCards extends StatefulWidget {
  const FloraInfoCards({super.key});

  @override
  State<FloraInfoCards> createState() => _FloraInfoCardsState();
}

class _FloraInfoCardsState extends State<FloraInfoCards> {
  /*List<Map<String,String>> flora = [
    {'nombreComun': 'Planta 1', 'nombreCientifico': 'NombreCien 1', 'datoCurioso': 'Dato curioso curioso', 'distribucion': 'Zonas rocosas', 'usos': 'Uso 1', 'linkImagen': 'https://www.metropolitan-touring.com/wp-content/uploads/2022/09/galapagos-plant-life-1.jpg'},
    {'nombreComun': 'Planta 2', 'nombreCientifico': 'NombreCien 2', 'datoCurioso': 'Dato curioso curioso', 'distribucion': 'Zonas humedas', 'usos': 'Uso 2', 'linkImagen': 'https://www.metropolitan-touring.com/wp-content/uploads/2022/09/galapagos-plant-life-harsh-conditions-1.jpg'},
    {'nombreComun': 'Planta 3', 'nombreCientifico': 'NombreCien 3', 'datoCurioso': 'Dato curioso curioso', 'distribucion': 'Islas de calor', 'usos': 'Uso 2', 'linkImagen': 'https://www.metropolitan-touring.com/wp-content/uploads/2022/09/endemic-lava-cactus-brachycereus-nesioticus.jpg'},
    {'nombreComun': 'Planta 4', 'nombreCientifico': 'NombreCien 4', 'datoCurioso': 'Dato curioso curioso', 'distribucion': 'Zonas templadas', 'usos': 'Uso 2', 'linkImagen': 'https://i0.wp.com/maytenusgalapagos.com/wp-content/uploads/2019/11/Mora-planta-invasora-Galapagos.jpg?resize=1024%2C683&ssl=1'},
    {'nombreComun': 'Planta 5', 'nombreCientifico': 'NombreCien 5', 'datoCurioso': 'Dato curioso curioso', 'distribucion': 'Ambiente caluroso', 'usos': 'Uso 2', 'linkImagen': 'https://i0.wp.com/maytenusgalapagos.com/wp-content/uploads/2019/11/Rabida-Galapagos.jpg?resize=1024%2C683&ssl=1'},
  ];*/
  List<Flora>? listaFlora;
  
  @override
  void initState() {
    super.initState();
    getFauna();
  }

  Future<void> getFauna() async {
    try{
      var response = await Dio().get('$urlBack/flora/buscar_flora/'); 
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        listaFlora = data.map((json) => Flora.fromJson(json)).toList();
        setState(() {}); 
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if(listaFlora != null && listaFlora!.isNotEmpty){
    return Expanded(
        child: ListView.builder(
            itemCount: listaFlora!.length,
            itemBuilder: (context, index) => FloraCard(
                nombreComun: listaFlora![index].nombreComun,
                nombreCientifico: listaFlora![index].nombreCientifico,
                datoCurioso: listaFlora![index].dato,
                distribucion: listaFlora![index].distribucion,
                usos: listaFlora![index].usos,
                linkImagen: listaFlora![index].imagen
            )
        )
    );}
    else{
    return const Center(
      child: Text("Cargando Flora Disponible")
    );}
  }

  /*@override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: flora.length,
        itemBuilder: (context, index) => FloraCard(
          nombreComun: flora[index]['nombreComun']!,
          nombreCientifico: flora[index]['nombreCientifico']!,
          datoCurioso: flora[index]['datoCurioso']!,
          distribucion: flora[index]['distribucion']!,
          usos: flora[index]['usos']!,
          linkImagen: flora[index]['linkImagen']!,
        )
      )
    );
  }*/
}