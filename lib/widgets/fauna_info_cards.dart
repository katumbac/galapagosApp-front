import 'package:flutter/material.dart';
import 'package:exploregalapagos/widgets/fauna_card.dart';
import 'package:exploregalapagos/models/fauna.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/shared/constants.dart';

class FaunaInfoCards extends StatefulWidget {
  const FaunaInfoCards({super.key});

  @override
  State<FaunaInfoCards> createState() => _FaunaInfoCardsState();
}

class _FaunaInfoCardsState extends State<FaunaInfoCards> {
  /*List<Map<String,String>> fauna = [
    {'nombreComun': 'Animal 1', 'nombreCientifico': 'NombreCien 1', 'datoCurioso': 'Dato curioso curioso', 'habitat': 'Zonas rocosas', 'alimentacion': 'Plantas', 'linkImagen': 'https://content.nationalgeographic.com.es/medio/2024/02/05/tortuga-gigante-galapagos_2a766ad7_240205124113_800x533.jpg'},
    {'nombreComun': 'Animal 2', 'nombreCientifico': 'NombreCien 2', 'datoCurioso': 'Dato curioso curioso', 'habitat': 'Zonas humedas', 'alimentacion': 'Plantas', 'linkImagen': 'https://www.metropolitan-touring.com/wp-content/uploads/2022/09/1_galapagos-marine-iguana.jpg'},
    {'nombreComun': 'Animal 3', 'nombreCientifico': 'NombreCien 3', 'datoCurioso': 'Dato curioso curioso', 'habitat': 'Islas de calor', 'alimentacion': 'Plantas', 'linkImagen': 'https://www.metrojourneys.com/wp-content/uploads/2020/02/blue-footed-boobies-iconic-courtship-dance-galapagos-islands.jpg'},
    {'nombreComun': 'Animal 4', 'nombreCientifico': 'NombreCien 4', 'datoCurioso': 'Dato curioso curioso', 'habitat': 'Zonas templadas', 'alimentacion': 'Plantas', 'linkImagen': 'https://www.metrojourneys.com/wp-content/uploads/2020/02/galapagos-sea-lion-floreana-island-galapagos.jpg'},
    {'nombreComun': 'Animal 5', 'nombreCientifico': 'NombreCien 5', 'datoCurioso': 'Dato curioso curioso', 'habitat': 'Ambiente caluroso', 'alimentacion': 'Plantas', 'linkImagen': 'https://www.metrojourneys.com/wp-content/uploads/2020/02/nazca-booby-punta-suarez-espa%C3%B1ola-island-galapagos.jpg'},
  ];*/

  List<Fauna>? listaFauna;
  
  @override
  void initState() {
    super.initState();
    getFauna();
  }

  Future<void> getFauna() async {
    try{
      var response = await Dio().get('$urlBack/fauna/buscar_fauna/'); 
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        listaFauna = data.map((json) => Fauna.fromJson(json)).toList();
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
    if(listaFauna != null && listaFauna!.length >0){
    return Expanded(
        child: ListView.builder(
            itemCount: listaFauna!.length,
            itemBuilder: (context, index) => FaunaCard(
                nombreComun: listaFauna![index].nombreComun,
                nombreCientifico: listaFauna![index].nombreCientifico,
                datoCurioso: listaFauna![index].dato,
                habitat: listaFauna![index].habitat,
                alimentacion: listaFauna![index].alimentacion,
                linkImagen: listaFauna![index].imagen
            )
        )
    );}
    else{
    return const Center(
      child: Text("Cargando Fauna Disponible")
    );}
  }
/*
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: fauna.length,
        itemBuilder: (context, index) => FaunaCard(
          nombreComun: fauna[index]['nombreComun']!,
          nombreCientifico: fauna[index]['nombreCientifico']!,
          datoCurioso: fauna[index]['datoCurioso']!,
          habitat: fauna[index]['habitat']!,
          alimentacion: fauna[index]['alimentacion']!,
          linkImagen: fauna[index]['linkImagen']!,
        )
      )
    );
  }*/
}