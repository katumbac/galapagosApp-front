import 'package:exploregalapagos/models/negocio.dart';
import 'package:flutter/material.dart';
import 'package:exploregalapagos/shared/custom_app_bar.dart';
import 'package:exploregalapagos/shared/constants.dart';
import 'package:exploregalapagos/widgets/item_selection.dart';
import 'package:exploregalapagos/widgets/negocio_card.dart';
import 'package:dio/dio.dart';
import 'package:exploregalapagos/models/tipo_negocio.dart';
import 'package:exploregalapagos/models/isla.dart';

class NegociosScreen extends StatefulWidget {
  const NegociosScreen({super.key});

  @override
  State<NegociosScreen> createState() => _NegociosScreenState();
}

class _NegociosScreenState extends State<NegociosScreen> {
  /*List<Map> negocios2 = [
    {'id': 1, 'nombreNegocio': 'Negocio 1', 'servicios': 'comidas ricas', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'Direccion 1', 'linkImagen': 'https://www.lavanguardia.com/files/image_990_484/files/fp/uploads/2021/12/23/61c456cc62a0b.r_d.2520-1680.jpeg'},
    {'id': 2, 'nombreNegocio': 'Negocio 2', 'servicios': 'desayunos a buen precio', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'Direccion 2', 'linkImagen': 'https://aureoarquitectura.com/wp-content/uploads/2023/09/Diseno-interior-restaurant.webp'},
    {'id': 3, 'nombreNegocio': 'Negocio 3', 'servicios': 'tiendita', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'Direccion 3', 'linkImagen': 'https://cdn.forbes.com.mx/2022/06/super-tienda-e1654633021697-640x360.jpg'},
    {'id': 4, 'nombreNegocio': 'Negocio 4', 'servicios': 'hotel nocturno', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'Direccion 5', 'linkImagen': 'https://cf.bstatic.com/xdata/images/hotel/max1024x768/262917546.jpg?k=3483ea13dd1d52efa6cbd3cb2444857bb35e3d4de05cff4f06086fe366a2186d&o=&hp=1'},
    {'id': 5, 'nombreNegocio': 'Negocio 5', 'servicios': 'comida comidita comidota', 'horaInicio': '6:30', 'horaFin': '21:00', 'direccion': 'Direccion 5', 'linkImagen': 'https://www.abasturhub.com/img/blog/mejores-restaurantes---diseno-sin-titulo.webp'},
  ];*/

  List<Negocio>? negocios;
  List<TipoNegocio>? tiposNegocio;
  List<Isla>? islas;

  List<String> nombreTiposNegocio = ['TODO'];
  List<String> nombreIslas = ['TODO'];

  String filtroTipoNegocio = 'TODO';
  String filtroIsla = 'TODO';

  List<Negocio>? negociosFiltrados = [];

  @override
  void initState() {
    super.initState();
    getTipoNegocio();
    getIslas();
    getNegocios();
  }

   Future<void> getTipoNegocio() async {
    try{
      var response = await Dio().get('$urlBack/tipo_negocio/tipos_negocio/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        tiposNegocio = data.map((json) => TipoNegocio.fromJson(json)).toList();
        setState(() {}); 
        nombresTipoNegocio();
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  void nombresTipoNegocio(){
    if(tiposNegocio != null){
    nombreTiposNegocio.addAll(tiposNegocio!.map((tipo) => tipo.tipo).toList()); 
    setState(() {});
    } 
  }

  Future<void> getIslas() async {
    try{
      var response = await Dio().get('$urlBack/isla/registradas/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        islas = data.map((json) => Isla.fromJson(json)).toList();
        setState(() {}); 
        nombresIsla();
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }

  void nombresIsla(){
    if(islas != null){
    nombreIslas.addAll(islas!.map((isla) => isla.nombre).toList()); 
    setState(() {});
    } 
  }

  Future<void> getNegocios() async {
    try{
      var response = await Dio().get('$urlBack/negocio/');
      if (response.statusCode == 200) {
        List<dynamic> data = response.data;
        negocios = data.map((json) => Negocio.fromJson(json)).toList();
        negociosFiltrados = negocios;
        setState(() {});
      }
    }
    catch (e) {
      if (e is DioException) {
        print('Error peticion');
      }
    }
  }


  void actualizarFiltro(String nuevaIsla, String nuevoTipo) {
    setState(() {
      filtroIsla = nuevaIsla;
      filtroTipoNegocio = nuevoTipo;

      if (filtroIsla == 'TODO') {
        if (filtroTipoNegocio == 'TODO') {
          negociosFiltrados = negocios;
        } else {
          negociosFiltrados = negocios!
              .where((negocio) => negocio.tipoNegocio.tipo.contains(filtroTipoNegocio))
              .toList();
        }
      } else {
        if (filtroTipoNegocio == 'TODO') {
          negociosFiltrados = negocios!
              .where((negocio) => negocio.isla.nombre.contains(filtroIsla))
              .toList();
        } else {
          negociosFiltrados = negocios!
              .where((negocio) => negocio.tipoNegocio.tipo.contains(filtroTipoNegocio))
              .where((negocio) => negocio.isla.nombre.contains(filtroIsla))
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
          appBar: const CustomAppBar(
            title: "Negocios",
            back: true,
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              const SizedBox(height: 15),
              Card.outlined(
                margin: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                color: Colors.white,
                elevation: 2,
                child: ItemSelection(
                      title: "Seleccionar Isla",
                      items: nombreIslas,
                      onSelected: (nuevaIsla) =>
                        actualizarFiltro(nuevaIsla, filtroTipoNegocio)
                  ),
              ),
              const SizedBox(height: 15),
              Card.outlined(
                margin: const EdgeInsets.fromLTRB(50.0, 5.0, 50.0, 5.0),
                color: Colors.white,
                elevation: 2,
                child: ItemSelection(
                      title: "Seleccionar Tipo de Negocio",
                      items: nombreTiposNegocio,
                      onSelected: (nuevoTipoNegocio) =>
                        actualizarFiltro(filtroIsla, nuevoTipoNegocio),
                  ),
              ),
              const SizedBox(height: 30),
              Expanded(
                child: ListView.builder(
                  itemCount: negociosFiltrados!.length,
                  itemBuilder: (context, index) => NegocioCard(
                    idNegocio: negociosFiltrados![index].id,
                    nombreNegocio: negociosFiltrados![index].nombre,
                    servicios: negociosFiltrados![index].servicios,
                    horaInicio: negociosFiltrados![index].horaInicio.toString(),
                    horaFin: negociosFiltrados![index].horaFin.toString(),
                    direccion: negociosFiltrados![index].direccion,
                    linkImagen: negociosFiltrados![index].imagen,
                    /*idNegocio: negocios2[index]['id'],
                    nombreNegocio: negocios2[index]['nombreNegocio']!,
                    servicios: negocios2[index]['servicios']!,
                    horaInicio: negocios2[index]['horaInicio']!,
                    horaFin: negocios2[index]['horaFin']!,
                    direccion: negocios2[index]['direccion']!,
                    linkImagen: negocios2[index]['linkImagen']!,*/
                  )
                )
              )   
              ],
          )
        );
  }
}
