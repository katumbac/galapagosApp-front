import 'package:exploregalapagos/models/tipo_negocio.dart';
import 'package:exploregalapagos/models/isla.dart';

class Negocio {
    final int id;
    final TipoNegocio tipoNegocio;
    final Isla isla;
    final String nombre;
    final String servicios;
    final String horaInicio;
    final String horaFin;
    final String direccion;
    final String imagen;

    Negocio({
        required this.id,
        required this.tipoNegocio,
        required this.isla,
        required this.nombre,
        required this.servicios,
        required this.horaInicio,
        required this.horaFin,
        required this.direccion,
        required this.imagen,
    });

    factory Negocio.fromJson(Map<String, dynamic> json) => Negocio(
        id: json["id"],
        tipoNegocio: TipoNegocio.fromJson(json["tipo_negocio"]),
        isla: Isla.fromJson(json["isla"]),
        nombre: json["nombre"],
        servicios: json["servicios"],
        horaInicio: json["hora_inicio"],
        horaFin: json["hora_fin"],
        direccion: json["direccion"],
        imagen: json["imagen"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "tipo_negocio": tipoNegocio.toJson(),
        "isla": isla.toJson(),
        "nombre": nombre,
        "servicios": servicios,
        "hora_inicio": horaInicio,
        "hora_fin": horaFin,
        "direccion": direccion,
        "imagen": imagen,
    };
}
